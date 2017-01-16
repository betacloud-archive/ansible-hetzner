#!/usr/bin/env bash
set -x

# Available environment variables:
#
# ANSIBLE_VERSION
# HETZNER_WEBSERVICE_PASSWORD
# HETZNER_WEBSERVICE_USERNAME
# TESTNODE

# Set default values:

ANSIBLE_VERSION=${ANSIBLE_VERSION:-2.2.0.0}

virtualenv venv
source venv/bin/activate
pip install ansible==$ANSIBLE_VERSION

export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i $TESTNODE, betacloud.hetzner/playbook.yml
