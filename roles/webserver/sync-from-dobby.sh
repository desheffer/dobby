#!/bin/bash

cd "$(dirname "$0")/files"

rsync -rv --delete --progress \
    --rsync-path="sudo rsync" \
    debian@192.168.0.50:/etc/letsencrypt/ etc/letsencrypt/
