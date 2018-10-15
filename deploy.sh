#!/bin/bash

set -e

cd "$(dirname "${0}")"

./init.sh --needed

FLAGS=""
if [ "${1}" == "--ask-pass" ]; then
    FLAGS="--ask-pass"
elif [ ! -z "${1}" ]; then
    FLAGS="-t ${1}"
fi

source venv/bin/activate
ansible-playbook ${FLAGS} deploy.yml \
    --vault-id ~/.vault_pass
