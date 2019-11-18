#!/bin/bash

set -e

cd "$(dirname "${0}")"

if [ ! -d venv ]; then
    virtualenv venv

    source venv/bin/activate
    pip install -r requirements.txt
fi

FLAGS=""
if [ "${1}" == "--ask-pass" ]; then
    FLAGS="--ask-pass"
elif [ ! -z "${1}" ]; then
    FLAGS="-t ${1}"
fi

source venv/bin/activate
ansible-playbook ${FLAGS} deploy.yml \
    --vault-id ~/.vault_pass
