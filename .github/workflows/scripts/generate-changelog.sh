#!/usr/bin/env bash

# Description: This script is used to generate the changelog for all changes in all repositories between a previous release tag and the current branch.
# Requirements: bash >= v4.0.0, curl, git, helm
# Usage: .github/workflows/scripts/generate-changelog.sh last_release_tag
# Environment variables: AUTO_RELEASE_TOKEN

set -e

####################################
# Environment and arguments check  #
####################################

usage() {
    echo "export AUTO_RELEASE_TOKEN=<github token>"
    echo "generate-changelog.sh last_release_tag"
}

# Check if the current shell is bash and the version is >= 4.0.0
if [ -z "$BASH_VERSION" ] || [ "${BASH_VERSION:0:1}" -lt 4 ]; then
    echo "This script requires bash >= v4.0.0. Please install bash >= v4.0.0 and try again."
    exit 1
fi

# Check if the AUTO_RELEASE_TOKEN environment variable is set
if [ -z "$AUTO_RELEASE_TOKEN" ]; then
    echo "The AUTO_RELEASE_TOKEN environment variable is not set. Please set the AUTO_RELEASE_TOKEN environment variable and try again."
    usage
    exit 1
fi

######################
# Global variables   #
######################

declare -A last_release_tags
declare -A current_tags

readonly -a excluded_charts=(
    "finance-portal"
    "finance-portal-settlement-management"
    "forensicloggingsidecar"
    "kube-system"
    "ml-operator"
    "centralenduserregistry"
    "centralkms"
    "example-mojaloop-bakend"
    "monitoring"
)

# 'last_release_tag' is the last release tag, if not provided, it will be the last tag in the current branch
if [ -z "$1" ] || [ $1 == null ]; then
    last_release_tag=$(git describe --tags --abbrev=0)
    echo "The \"last_release_tag\" argument is not provided. Using last tag in the current branch: $last_release_tag"
else
    last_release_tag=$1
fi

#######################
# Prepare environment #
#######################

# We store the changelogs, commits, tags etc. in a temporary directory
dir=".tmp"

# If the directory exists, remove its contents
if [ -d "$dir" ]; then
    rm -rf "$dir"/*
fi

# Create the temp directory and subdirectories
mkdir -p "$dir/changelogs"
mkdir -p "$dir/tags"

######################
# Generate changelog #
######################

current_branch=$(git branch --show-current)

# Extract and store repository name and tag in all values.yaml files
find . -type d -name '[!.]*' -exec test -e "{}/Chart.yaml" ';' -print | while read chart_dir; do
    base_chart_dir=$(echo $chart_dir | cut -d'/' -f2)
    if [[ ! " ${excluded_charts[@]} " =~ " ${base_chart_dir} " ]]; then
        helm show values "$chart_dir" | grep -E 'repository:|tag:' | awk '{print $1 $2}' >> "${dir}/tags/current-tags.log"
    fi
done

# Checkout out last release tag and extract repository name and tag in its all values.yaml files
# Extract CURRENT tags from the current working tree
find . -type d -name '[!.]*' -exec test -e "{}/Chart.yaml" ';' -print | while read -r chart_dir; do
  base_chart_dir=$(echo "$chart_dir" | cut -d'/' -f2)
  if [[ ! " ${excluded_charts[*]} " =~ " ${base_chart_dir} " ]]; then
    helm show values "$chart_dir" | grep -E 'repository:|tag:' | awk '{print $1 $2}' >> "${dir}/tags/current-tags.log"
  fi
done

# Extract LAST RELEASE tags using a temporary git worktree
last_release_wt="${dir}/worktrees/last-release"
mkdir -p "${dir}/worktrees"
git worktree add -f "$last_release_wt" "$last_release_tag" >/dev/null

find "$last_release_wt" -type d -name '[!.]*' -exec test -e "{}/Chart.yaml" ';' -print | while read -r chart_dir; do
  rel="${chart_dir#${last_release_wt}/}"
  base_chart_dir=$(echo "$rel" | cut -d'/' -f1)
  if [[ ! " ${excluded_charts[*]} " =~ " ${base_chart_dir} " ]]; then
    helm show values "$chart_dir" | grep -E 'repository:|tag:' | awk '{print $1 $2}' >> "${dir}/tags/last-release-tags.log"
  fi
done

git worktree remove -f "$last_release_wt" >/dev/null

# accept all stashed changes
# git stash list | awk -F: '{print $1}' | xargs -n 1 git stash apply

# Generate the changelog using repositories and tags from last-release-tags.log and current-tags.log
# We create two associative arrays to store the repositories and tags from last-release-tags.log and current-tags.log
# The associative arrays are indexed by the repository name and the value is the tag
# We then iterate through the associative arrays and generate the changelog for each repository that has changed

# Trim leading/trailing whitespace (pure bash, no xargs)
trim() {
  local s="$1"
  s="${s#"${s%%[![:space:]]*}"}"   # leading
  s="${s%"${s##*[![:space:]]}"}"   # trailing
  printf '%s' "$s"
}
############################################
# Read last release tags into associative array 'last_release_tags'
############################################
while IFS= read -r line; do
  if [[ $line == repository:* ]]; then
    repository="$(trim "${line#repository:}")"
    last_release_tags["$repository"]=null

  elif [[ $line == tag:* ]]; then
    tag="$(trim "${line#tag:}")"
    last_release_tags["$repository"]="$tag"
  fi
done < "$dir/tags/last-release-tags.log"

############################################
# Read current tags into associative array 'current_tags'
############################################
while IFS= read -r line; do
  if [[ $line == repository:* ]]; then
    repository="$(trim "${line#repository:}")"
    current_tags["$repository"]=null

  elif [[ $line == tag:* ]]; then
    tag="$(trim "${line#tag:}")"
    current_tags["$repository"]="$tag"
  fi
done < "$dir/tags/current-tags.log"

echo "DEBUG: last_release_tags entries = ${#last_release_tags[@]}"
echo "DEBUG: current_tags entries      = ${#current_tags[@]}"

echo "DEBUG: sample last_release_tags:"
for k in "${!last_release_tags[@]}"; do echo "  $k => ${last_release_tags[$k]}"; break; done
echo "DEBUG: sample current_tags:"
for k in "${!current_tags[@]}"; do echo "  $k => ${current_tags[$k]}"; break; done
############################################
# Generate changelog for repos that changed
############################################

is_bad_ref() {
  local ref="$1"
  ref="$(trim "$ref")"

  # empty / null
  [[ -z "$ref" || "$ref" == "null" ]] && return 0

  # obvious templating or quoting artifacts
  [[ "$ref" == *"{{"* || "$ref" == *"}}"* || "$ref" == *"{"* || "$ref" == *"}"* ]] && return 0
  [[ "$ref" == *"\""* || "$ref" == *"'"* ]] && return 0

  # whitespace inside ref is suspicious for URLs
  [[ "$ref" =~ [[:space:]] ]] && return 0

  return 1
}

for repository in "${!last_release_tags[@]}"; do
  last="${last_release_tags[$repository]}"
  curr="${current_tags[$repository]}"

  echo "DEBUG repo=[$repository] last=[$last] curr=[$curr]"

  # Only Mojaloop GitHub repos in owner/repo form
  if [[ "$repository" != mojaloop/* ]]; then
    continue
  fi

  # Need both refs and must be different
  if is_bad_ref "$last" || is_bad_ref "$curr"; then
    echo "WARN: skipping $repository due to bad ref(s): last=[$last] curr=[$curr]" >&2
    continue
  fi

  if [[ "$last" == "$curr" ]]; then
    continue
  fi

  repository_short_name="$(echo "$repository" | cut -d'/' -f2)"
  out="$dir/changelogs/$repository_short_name.json"

  url="https://api.github.com/repos/$repository/compare/${last}...${curr}"

  # Do not let a single repo failure kill the whole script
  http_code="$(curl -sS -L -o "$out" -w "%{http_code}" \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $AUTO_RELEASE_TOKEN" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "$url" || true)"

  if [[ "$http_code" != "200" ]]; then
    echo "WARN: compare failed for $repository ($http_code) url=$url" >&2
    rm -f "$out"
    continue
  fi
done

echo "Changelog generated successfully."
