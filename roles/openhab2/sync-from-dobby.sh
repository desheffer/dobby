#!/bin/bash

cd "$(dirname "$0")/files"

rsync -rv --delete --progress \
    debian@192.168.0.50:/etc/openhab2/ etc/openhab2/

echo
git status .
