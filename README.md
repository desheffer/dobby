# dobby

This is the Ansible Playbook to configure my openHAB 2 home automation server.

Current hardware:
- BeagleBone Black
- Z-Wave Z-Stick Series 2

## Setup

Download a recent Debian image from https://beagleboard.org/latest-images:

    wget -O debian.img.xz https://rcn-ee.com/rootfs/2017-06-08/flasher/BBB-eMMC-flasher-debian-8.8-console-armhf-2017-06-08-2gb.img.xz

Prepare the SD card:

    diskutil list

    diskutil unmountDisk /dev/disk2
    xzcat debian.img.xz | sudo dd of=/dev/disk2

Boot the SD card to run the eMMC flasher.

Reboot and run the Ansible playbook:

    virtualenv venv
    source venv/bin/activate
    pip install -r requirements.txt

    ./deploy.sh
