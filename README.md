# dobby

This is the Ansible Playbook to configure my home automation server.

Current hardware:
- Raspberry Pi 3
- Z-Wave Z-Stick Series 2

## Setup

Prepare the SD card:

    ./prepare-sd-card.sh

Set up a Python virtual environment:

    virtualenv venv
    source venv/bin/activate
    pip install -r requirements.txt

Run the Ansible playbook:

    ./deploy.sh --ask-pass

You will be prompted for the initial password, which is `raspberry`.

## Update

To re-run the Ansible playbook after the intial setup is complete:

    source venv/bin/activate
    ./deploy.sh
