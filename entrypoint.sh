#!/bin/sh -l

echo "Start validation $1"


echo ::set-env name=BRANCH::$(git branch -r --contains ${GITHUB_SHA} | grep "")
echo ::set-env name=RELEASE_VERSION::$(echo ${GITHUB_REF} | sed -e "s/refs\/tags\///g" | sed -e "s/\//-/g")

MASTER_BRANCH_NAME='origin/master'
RELEASE_PREFIX='r-'

if [[ "${{ env.BRANCH }}" == *"$MASTER_BRANCH_NAME"* ]] && [[ "${{ env.RELEASE_VERSION }}" == "$RELEASE_PREFIX"* ]]; then
  echo ::set-output name=validation_response::"Release tag validation succeeded!"
  exit 0
else
  echo ::set-output name=validation_response::"Release tag validation failed!"
  exit 1
fi
