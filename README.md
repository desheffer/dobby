# dobby

This is the Ansible Playbook to configure my openHAB 2 home automation server.

Current hardware:
- BeagleBone Black
- Z-Wave Z-Stick Series 2

## Setup

Download a recent Debian image from https://beagleboard.org/latest-images:

    wget -O debian.img.xz https://rcn-ee.com/rootfs/2018-01-05/flasher/BBB-eMMC-flasher-debian-9.3-console-armhf-2018-01-05-2gb.img.xz

Prepare the SD card:

    diskutil list

    diskutil unmountDisk /dev/disk2
    xzcat debian.img.xz | sudo dd of=/dev/disk2

Boot the SD card to run the eMMC flasher. Reboot when finished.

Run the Ansible playbook:

    virtualenv venv
    source venv/bin/activate
    pip install -r requirements.txt

    ./init.sh # default password is 'temppwd'
    ./deploy.sh
