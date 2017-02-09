#!/usr/bin/env bash

# This file is subject to the terms and conditions defined in file 'LICENSE',
# which is part of this repository.

# Available environment variables
#
# OPENRCFILE

# Set default values

OPENRCFILE=${OPENRCFILE:-openrc}
if [[ -e $OPENRCFILE ]]; then
    source $OPENRCFILE
fi

if [[ -e tox.ini ]]; then
    tox -e destroy
fi
