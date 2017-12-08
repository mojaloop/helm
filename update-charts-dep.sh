#!/bin/bash
echo "Updating all Charts..."

find . -mindepth 1 -maxdepth 1 -type d -exec helm dep up {} \;
find ./kube-public -mindepth 1 -maxdepth 1 -type d -exec helm dep up {} \;

echo ""
echo "Chart updates completed. Ensure you check the output for any errors."
