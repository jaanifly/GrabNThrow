#!/bin/bash
OLD_REPO_PATH=$1
NEW_REPO_PATH=$2
OLD_REPO_DIR=$(basename $1)

echo "TASK: Getting bare copy of $OLD_REPO_PATH"
git clone --bare $OLD_REPO_PATH > /dev/null

cd $OLD_REPO_DIR
echo "TASK: Pushing mirror to $NEW_REPO_PATH"
git push --mirror $NEW_REPO_PATH

cd ..
echo "TASK: Performing Cleanup"
rm -rf $OLD_REPO_DIR
echo "Done"
