#!/bin/sh

echo "Setting BASH_ENV..." | tee git.log 
source $BASH_ENV

echo "Fetching info from remote $GITHUB_PROJECT_USERNAME" | tee git.log 
git fetch -q $GITHUB_PROJECT_USERNAME &> git.log

echo "Fetching tags from remote $GITHUB_PROJECT_USERNAME" | tee git.log 
git fetch -q --tags $GITHUB_PROJECT_USERNAME &> git.log

echo "Checking out $GITHUB_TARGET_BRANCH" | tee git.log 
git checkout -b $GITHUB_TARGET_BRANCH $GITHUB_PROJECT_USERNAME/$GITHUB_TARGET_BRANCH &> git.log

echo "Merging tagged release code from $GITHUB_TAG..." | tee git.log 
git merge --no-commit $GITHUB_TAG &> git.log

echo "Checking for merge conflicts" | tee git.log 
if [ $(git ls-files -u | wc -l) == 0 ]
then
  echo "Merge conflict not-detected. Continuing..." | tee git.log
else
  echo "Merge conflict detected. Abort!" | tee git.log && exit 1
fi

echo "Package helm charts..." | tee git.log 
sh package.sh

echo "Staging general changes..." | tee git.log 
git add -A

echo "Staging packaged Helm charts..." | tee git.log 
git add -f repo/*.*

echo "Commiting changes..." | tee git.log 
git commit -a -m "Updating release to $GITHUB_TAG"

echo "Publishing $GITHUB_TAG release to $GITHUB_TARGET_BRANCH on github..." | tee git.log 
git push -q $GITHUB_PROJECT_USERNAME $GITHUB_TARGET_BRANCH &> git.log
