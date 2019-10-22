#!/bin/bash

cd "$(dirname "$0")/files"

rsync -rv --delete --progress \
    pi@192.168.1.50:/etc/openhab2/ etc/openhab2/

echo
git status .
