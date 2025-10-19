#!/usr/bin/env bash

# Description: This script updates the Helm charts dependencies
# Requirements: bash, updatecli, helm
# Usage: .github/workflows/scripts/update-charts.sh
# Environment variables: AUTO_RELEASE_TOKEN

set -e

# We store output log in a temporary directory
dir=".tmp"

# Create temporary directory if it doesn't exist
if [ ! -d "$dir" ]; then
    mkdir $dir
fi

# First pass - update with github releases and published helm charts
updatecli apply --config .github/workflows/manifests/first-pass

# Second pass - update with locally referenced charts
# runs the second-pass manifests repeatedly until no changes are detected
>$dir/output.log

pass_count=0

# Repeatedly run the second-pass manifests until no changes are detected
while ! (grep -q "* Changed:	0" $dir/output.log); do
    echo -e "\nUpdating charts ... pass: $((++pass_count))\n"
    ./update-charts-dep.sh 
    find . -maxdepth 1 -type d -not -path '*/\.*' | sed 's/^\.\///g' | xargs -I {} helm repo index {} 
    updatecli apply --config .github/workflows/manifests/second-pass |& tee $dir/output.log
done

# Revert newline changes in charts
# Updatecli currently does not preserve line breaks in yaml files - issue https://github.com/goccy/go-yaml/pull/412
# This is a temporary workaround to revert the changes
# git diff --ignore-blank-lines --no-color | git apply --cached --ignore-whitespace && git checkout -- . && git reset

# Capture and show git apply output if it fails
if ! output=$(git diff --ignore-blank-lines --no-color | \
              git apply --cached --ignore-whitespace 2>&1); then
  echo "git apply failed with exit code $?."
  echo "---- git apply output ----"
  echo "$output"
  echo "---------------------------"
  exit 1  # Explicitly fail the job
fi

# Only runs if patch succeeded
git restore --staged .
git restore .
