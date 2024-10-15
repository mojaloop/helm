#!/bin/bash

# Function to clone repo, checkout specific tag, and build docker image
build_docker_image_from_repo() {
  IMAGE=$1
  REPO=$2
  TAG=$3

  # Extract repo name for tagging image
  REPO_NAME=$(basename "$REPO" .git)

  echo "Building Docker image from repo $REPO with tag $TAG"

  # Clone the repo
  git clone "$REPO"
  cd "$REPO_NAME" || exit

  # Checkout the specified tag
  git checkout "$TAG"

  # Build the Docker image for ARM64
  docker build -t "$IMAGE" .

  # Cleanup and go back to parent directory
  cd .. || exit
  rm -rf "$REPO_NAME"
}

# 1. Render the Helm chart template and extract image lines
HELM_RELEASE="moja"
HELM_CHART="../../mojaloop/"

IMAGES=$(helm template "$HELM_RELEASE" "$HELM_CHART" | grep "image:" | awk '{print $2}')

# 2. Create a temporary file to track unique image repo + tag combinations
touch processed_images.txt

for IMAGE in $IMAGES
do
  # Remove any quotes around the image string
  IMAGE=$(echo $IMAGE | sed 's/^"//;s/"$//')

  # Check if the image starts with "mojaloop/"
  if [[ $IMAGE == mojaloop/* ]]; then
    # Extract the image repo name (mojaloop/account-lookup-service) and tag (v15.4.0-snapshot.33)
    REPO_NAME=$(echo "$IMAGE" | cut -d ':' -f 1 | sed 's#mojaloop/##') # account-lookup-service
    TAG=$(echo "$IMAGE" | cut -d ':' -f 2)                             # v15.4.0-snapshot.33

    # Construct the Git repository URL based on the repo name
    GIT_REPO="https://github.com/mojaloop/$REPO_NAME"

    # Create a unique key combining the repo and tag (to handle duplicates)
    UNIQUE_KEY="$REPO_NAME:$TAG"

    # Check if this unique key has already been processed
    if ! grep -q "$UNIQUE_KEY" processed_images.txt; then
      # Mark this image as processed by writing it to the temporary file
      echo "$UNIQUE_KEY" >> processed_images.txt

      # Run the build function in the background
      build_docker_image_from_repo "$IMAGE" "$GIT_REPO" "$TAG" &
    else
      echo "Skipping duplicate image: $IMAGE"
    fi
  else
    echo "Skipping non-mojaloop image: $IMAGE"
  fi
done

# Wait for all background jobs to finish
wait

# Clean up the temporary file
rm processed_images.txt