#!/bin/bash

# Directory containing the .tgz and .prov files
REPO_DIR="./repo"
#after if goes to the working directory 
# REPO_DIR="/tmp/release"

# Check if the directory exists
if [[ ! -d "$REPO_DIR" ]]; then
  echo "Directory $REPO_DIR does not exist."
  exit 1
fi

# Navigate to the directory
cd "$REPO_DIR" 

# Loop through all .tgz files in the directory
for tgz_file in *.tgz; do
  # Check if there are any .tgz files
  if [[ ! -e "$tgz_file" ]]; then
    echo "No .tgz files found in $REPO_DIR."
    exit 1
  fi

  # Execute helm verify command
  echo "Verifying $tgz_file..."
  helm verify "$tgz_file"

  # Check the return status of the helm verify command
  if [[ $? -ne 0 ]]; then
    echo "Verification failed for $tgz_file."
    exit 1
  else
    echo "Verification successful for $tgz_file."
  fi
done

