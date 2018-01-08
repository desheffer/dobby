#!/bin/bash

cd "$(dirname "$0")"

FLAGS=""
if [ "$1" == "--ask-pass" ]; then
    FLAGS="--ask-pass"
elif [ ! -z "$1" ]; then
    FLAGS="-t $1"
fi

ansible-playbook $FLAGS deploy.yml \
    --vault-id ~/.vault_pass
