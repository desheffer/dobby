#!/bin/bash

cd "$(dirname "$0")/files"

rsync -rv --delete --progress \
    --rsync-path="sudo rsync" \
    etc/letsencrypt/ debian@192.168.0.50:/etc/letsencrypt/
