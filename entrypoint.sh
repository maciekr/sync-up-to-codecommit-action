#!/bin/sh

set -ue

RepositoryName="${INPUT_REPOSITORY_NAME}"
AwsRegion="${INPUT_AWS_REGION}"
CodeCommitUrl="${INPUT_CODECOMMIT_URL}" 
BranchFrom=${INPUT_BRANCH_FROM}
BranchTo=${INPUT_BRANCH_TO}

echo ${CodeCommitUrl}

git config --global --add safe.directory /github/workspace
git config --global credential.UseHttpPath true
git remote add sync ${CodeCommitUrl}
git push -f sync ${BranchFrom}:${BranchTo}
