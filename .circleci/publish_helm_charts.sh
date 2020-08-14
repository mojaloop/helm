#!/usr/bin/env bash

REVISION=${GITHUB_TAG:-$GIT_SHA1}
if [ -n ${GITHUB_TAG} ]; then
  COMMIT_MESSAGE="Updating development release to $REVISION"
else 
  COMMIT_MESSAGE="Updating release to $REVISION"
fi

set -euox pipefail

echo "Setting BASH_ENV..." | tee git.log 
source $BASH_ENV

echo "Fetching info from remote $GITHUB_PROJECT_USERNAME" | tee git.log 
git fetch -q $GITHUB_PROJECT_USERNAME &> git.log

echo "Fetching tags from remote $GITHUB_PROJECT_USERNAME" | tee git.log 
git fetch -q --tags $GITHUB_PROJECT_USERNAME &> git.log

echo "Checking out $GITHUB_TARGET_BRANCH" | tee git.log 
git checkout -b $GITHUB_TARGET_BRANCH $GITHUB_PROJECT_USERNAME/$GITHUB_TARGET_BRANCH &> git.log

echo "Merging code from $REVISION..." | tee git.log 
git merge --no-commit $REVISION &> git.log

echo "Checking for merge conflicts" | tee git.log 
if [ $(git ls-files -u | wc -l) == 0 ]
then
  echo "Merge conflict not-detected. Continuing..." | tee git.log
else
  echo "Merge conflict detected. Abort!" | tee git.log && exit 1
fi

echo "Package helm charts..." | tee git.log 
bash package.sh

echo "Staging general changes..." | tee git.log 
git add -A

echo "Staging packaged Helm charts..." | tee git.log 
git add -f repo/*.*

echo "Commiting changes..." | tee git.log 
git commit -a -m "'$COMMIT_MESSAGE'"

echo "Publishing $REVISION release to $GITHUB_TARGET_BRANCH on github..." | tee git.log 
git push -q $GITHUB_PROJECT_USERNAME $GITHUB_TARGET_BRANCH &> git.log
