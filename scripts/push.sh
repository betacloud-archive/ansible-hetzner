#!/usr/bin/env bash
set -x

# This file is subject to the terms and conditions defined in file 'LICENSE',
# which is part of this repository.

# Available environment variables
#
# NEXUS_ARTIFACT_REPOSITORY
# NEXUS_ARTIFACT_NAME
# NEXUS_ARTIFACT_TAG
# NEXUS_USERNAME
# NEXUS_PASSWORD
# NEXUS_SERVER
#
# NEXUSFILE

# Set default values

NEXUSFILE=${NEXUSFILE:-nexus}
if [[ -e $NEXUSFILE ]]; then
    source $NEXUSFILE
fi

HASH=$(git rev-parse --short HEAD)
NEXUS_ARTIFACT_TAG="$(date '+%Y%m%d-%H%M')-$HASH"
ARCHIVE=$NEXUS_ARTIFACT_NAME-$NEXUS_ARTIFACT_TAG.tar.gz

if [[ ! -z $(git tag | grep $HASH) ]]; then
    exit 0
fi

# Push to git server

git tag $NEXUS_ARTIFACT_TAG
git push --tags

# Push to nexus server

tar cvzf $ARCHIVE README.md defaults files handlers meta tasks
mkdir $NEXUS_ARTIFACT_NAME
tar xvzf $ARCHIVE -C $NEXUS_ARTIFACT_NAME
tar cvzf $ARCHIVE $NEXUS_ARTIFACT_NAME
curl -v --user "$NEXUS_USERNAME:$NEXUS_PASSWORD" --upload-file $ARCHIVE https://$NEXUS_SERVER/repository/$NEXUS_ARTIFACT_REPOSITORY/$ARCHIVE
curl -v --user "$NEXUS_USERNAME:$NEXUS_PASSWORD" --upload-file $ARCHIVE https://$NEXUS_SERVER/repository/$NEXUS_ARTIFACT_REPOSITORY/$NEXUS_ARTIFACT_NAME-latest.tar.gz
rm -f $ARCHIVE
rm -rf $NEXUS_ARTIFACT_NAME
