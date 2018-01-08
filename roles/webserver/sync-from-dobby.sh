#!/bin/bash

cd "$(dirname "$0")/files"

rsync -av --delete --progress \
    --rsync-path="sudo rsync" \
    pi@192.168.0.55:/etc/letsencrypt/ etc/letsencrypt/
