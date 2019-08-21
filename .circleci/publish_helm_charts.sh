#!/bin/sh

echo "Setting BASH_ENV..."
source $BASH_ENV

echo "Fetching info from remote $GITHUB_PROJECT_USERNAME"
git fetch -q $GITHUB_PROJECT_USERNAME &> git.log

echo "Fetching tags from remote $GITHUB_PROJECT_USERNAME"
git fetch -q --tags $GITHUB_PROJECT_USERNAME &> git.log

echo "Checking out $GITHUB_TARGET_BRANCH"
git checkout -b $GITHUB_TARGET_BRANCH $GITHUB_PROJECT_USERNAME/$GITHUB_TARGET_BRANCH &> git.log

echo "Merging tagged release code from $GITHUB_TAG..."
git merge --no-commit $GITHUB_TAG &> git.log

echo "Package helm charts..."
sh package.sh

echo "Staging general changes..."
git add -A

echo "Staging packaged Helm charts..."
git add -f repo/*.*

echo "Commiting changes..."
git commit -a -m "Updating release to $GITHUB_TAG"

echo "Publishing $GITHUB_TAG release to $GITHUB_TARGET_BRANCH on github..."
git push -q $GITHUB_PROJECT_USERNAME $GITHUB_TARGET_BRANCH &> git.log
