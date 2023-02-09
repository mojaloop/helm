#!/usr/bin/env bash

REVISION=${GITHUB_TAG:-$GIT_SHA1}
WORKING_RELEASE_DIRECTORY=/tmp/release
if [ -n ${GITHUB_TAG} ]; then
  COMMIT_MESSAGE="Updating development release to $REVISION"
else
  COMMIT_MESSAGE="Updating release to $REVISION"
fi

set -eox pipefail

echo "Setting BASH_ENV..." | tee git.log
source $BASH_ENV

echo "Fetching info from remote $GITHUB_PROJECT_USERNAME" | tee git.log
git fetch -q $GITHUB_PROJECT_USERNAME &> git.log

echo "Fetching tags from remote $GITHUB_PROJECT_USERNAME" | tee git.log
git fetch -q --tags $GITHUB_PROJECT_USERNAME &> git.log

echo "Clone fresh directory into target branch" | tee git.log
git clone -b $GITHUB_TARGET_BRANCH --single-branch $CIRCLE_REPOSITORY_URL $WORKING_RELEASE_DIRECTORY &> git.log

echo "Package helm charts..." | tee git.log
bash package.sh

echo "Move packaged charts to release directory" | tee git.log
mv repo/*.* $WORKING_RELEASE_DIRECTORY

echo "Switch to release directory" | tee git.log
cd $WORKING_RELEASE_DIRECTORY
ls
git status

echo "Staging packaged Helm charts..." | tee git.log
git add -f repo/*.*

echo "Commiting changes..." | tee git.log
git commit -a -m "'$COMMIT_MESSAGE'"
git log

echo "Publishing $REVISION release to $GITHUB_TARGET_BRANCH on github..." | tee git.log
# git push -q $GITHUB_PROJECT_USERNAME $GITHUB_TARGET_BRANCH &> git.log
