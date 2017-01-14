#!/usr/bin/env bash
set -x

# Available environment variables:
#
# HETZNER_WEBSERVICE_PASSWORD
# HETZNER_WEBSERVICE_USERNAME
# TESTNODE

virtualenv venv
source venv/bin/activate
pip install ansible==2.2.0.0

export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i $TESTNODE, betacloud.hetzner/playbook.yml
