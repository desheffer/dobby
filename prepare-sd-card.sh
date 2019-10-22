#!/bin/bash

cd ~/Downloads

# Defaults:
DISK="/dev/mmcblk0"
WIRELESS_SSID=""
WIRELESS_PASSWORD=""

lsblk
echo

read -p "Disk to write [${DISK}]: "
[ ! -z "${REPLY}" ] && DISK="${REPLY}"

read -p "Wireless SSID [${WIRELESS_SSID}]: "
[ ! -z "${REPLY}" ] && WIRELESS_SSID="${REPLY}"

read -p "Wireless password [${WIRELESS_PASSWORD}]: "
[ ! -z "${REPLY}" ] && WIRELESS_PASSWORD="${REPLY}"

if [ ! -f raspbian.zip ]; then
    echo
    echo "Downloading Raspbian Lite image..."

    wget -O raspbian.zip https://downloads.raspberrypi.org/raspbian_lite_latest
fi

echo
echo "Writing disk image..."

unzip -p raspbian.zip | sudo dd bs=1M of="${DISK}"
sleep 5

VOLUME="$(lsblk -no MOUNTPOINT "${DISK}p1")"
if [ ! -d "${VOLUME}" ]; then
    echo
    echo "An error occurred."
    exit 1
fi

echo
echo "Setting up wireless..."

cat > "${VOLUME}/wpa_supplicant.conf" <<EOF
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
network={
    ssid="${WIRELESS_SSID}"
    psk="${WIRELESS_PASSWORD}"
    key_mgmt=WPA-PSK
}
EOF

echo
echo "Setting up SSH..."

touch "${VOLUME}/ssh"

echo
echo "Ejecting disk..."

umount -q "${DISK}p"*

echo
echo "Done! You may now remove the disk and insert it into the Raspberry Pi."
