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
echo "Running git status to see current state"
git status
echo "Running git stash to save current changes..."
git stash
git switch --detach $last_release_tag
find . -type d -name '[!.]*' -exec test -e "{}/Chart.yaml" ';' -print | while read chart_dir; do
    base_chart_dir=$(echo $chart_dir | cut -d'/' -f2)
    if [[ ! " ${excluded_charts[@]} " =~ " ${base_chart_dir} " ]]; then
        helm show values "$chart_dir" | grep -E 'repository:|tag:' | awk '{print $1 $2}' >> "${dir}/tags/last-release-tags.log"
    fi
done

# Checkout back to current branch
git checkout $current_branch
# git stash pop

echo "🔄 Restoring stashed changes..."
if ! output=$(git stash pop 2>&1); then
  echo "❌ git stash pop failed with exit code $?."
  echo "---- git stash pop output ----"
  echo "$output"
  echo "------------------------------"
  # You can choose to fail or continue depending on your workflow:
  exit 1
else
  echo "✅ git stash pop succeeded."
  echo "$output"
fi

echo "Running git status to see current state"
git status

# accept all stashed changes
# git stash list | awk -F: '{print $1}' | xargs -n 1 git stash apply

# Generate the changelog using repositories and tags from last-release-tags.log and current-tags.log
# We create two associative arrays to store the repositories and tags from last-release-tags.log and current-tags.log
# The associative arrays are indexed by the repository name and the value is the tag
# We then iterate through the associative arrays and generate the changelog for each repository that has changed

# Read last release tags into associative array 'last_release_tags' 
while IFS= read -r line
do
    if [[ $line == *"repository:"* ]]
    then
        repository=$(echo $line | cut -d':' -f2 | cut -d' ' -f1)
        last_release_tags[$repository]=null
    fi
    
    if [[ $line == *"tag:"* ]]
    then
        tag=$(echo $line | cut -d':' -f2)
        last_release_tags[$repository]=$tag
    fi
done < "$dir/tags/last-release-tags.log"

# Read current tags into associative array 'current_tags'
while IFS= read -r line
do
    if [[ $line == *"repository:"* ]]
    then
        repository=$(echo $line | cut -d':' -f2 | cut -d' ' -f1)
        current_tags[$repository]=null
    fi
    
    if [[ $line == *"tag:"* ]]
    then
        tag=$(echo $line | cut -d':' -f2)
        current_tags[$repository]=$tag
    fi
done < "$dir/tags/current-tags.log"

# Generate changelog for each mojaloop repository that has changed using github api
for repository in "${!last_release_tags[@]}"
do
    if [[ $repository == mojaloop* && ${current_tags[$repository]} && ${last_release_tags[$repository]} != ${current_tags[$repository]} ]]
    then
        repository_short_name=$(echo $repository | cut -d'/' -f2)
        curl -s -L \
            -H "Accept: application/vnd.github+json" \
            -H "Authorization: Bearer $AUTO_RELEASE_TOKEN" \
            -H "X-GitHub-Api-Version: 2022-11-28" \
            https://api.github.com/repos/$repository/compare/${last_release_tags[$repository]}...${current_tags[$repository]} > $dir/changelogs/$repository_short_name.json
    fi
done

echo "Changelog generated successfully."
