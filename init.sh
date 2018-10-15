#!/bin/bash

set -e

cd "$(dirname "${0}")"

if [ -d venv ] && [ "${1}" == "--needed" ]; then
    exit 0
fi

rm -rf venv
virtualenv venv

source venv/bin/activate
pip install -r requirements.txt
