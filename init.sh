#!/bin/bash

cd "$(dirname "$0")"

ansible-playbook init.yml \
    --vault-password-file ~/.vault_pass \
    --extra-vars "ansible_ssh_pass=temppwd" \
    --become \
    --become-user=root \
    --extra-vars "ansible_become_pass=temppwd"
