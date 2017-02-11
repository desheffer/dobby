#!/bin/bash

cd "$(dirname "$0")"

FLAGS=""
if [ ! -z "$1" ]; then
    FLAGS="-t $1"
fi

ansible-playbook $FLAGS deploy.yml \
    --vault-password-file ~/.vault_pass
