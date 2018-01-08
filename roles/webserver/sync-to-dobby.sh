#!/bin/bash

cd "$(dirname "$0")/files"

rsync -av --delete --progress \
    --rsync-path="sudo rsync" \
    etc/letsencrypt/ pi@192.168.0.55:/etc/letsencrypt/
