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

ARCHIVE=$NEXUS_ARTIFACT_NAME-$NEXUS_ARTIFACT_TAG.tar.gz

tar cvzf $ARCHIVE README.md defaults files handlers meta tasks
mkdir $NEXUS_ARTIFACT_NAME
tar xvzf $ARCHIVE -C $NEXUS_ARTIFACT_NAME
tar cvzf $ARCHIVE $NEXUS_ARTIFACT_NAME
curl -v --user "$NEXUS_USERNAME:$NEXUS_PASSWORD" --upload-file $ARCHIVE https://$NEXUS_SERVER/repository/$NEXUS_ARTIFACT_REPOSITORY/$ARCHIVE
rm -f $ARCHIVE
rm -rf $NEXUS_ARTIFACT_NAME
