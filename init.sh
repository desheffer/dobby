#!/bin/bash

cd "$(dirname "$0")"

ansible-playbook init.yml \
    --ask-pass \
    --extra-vars "ansible_become_pass=temppwd"
