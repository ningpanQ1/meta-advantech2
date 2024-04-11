#!/bin/sh

# Based off:
# https://github.com/RobertCNelson/boot-scripts/blob/master/boot/am335x_evm.sh

# Assume some defaults
sleep 15
SERIAL_NUMBER="1234BBBK5678"
PRODUCT="am335xepcr3220a1"
manufacturer="Advantech"

echo "SERIAL_NUMBER = ${SERIAL_NUMBER}"
echo "PRODUCT = ${PRODUCT}"

rootdrive=`mount | grep 'on / ' | awk {'print $1'} |  cut -c6-12`

mac_address="/proc/device-tree/ocp/interconnect@4a000000/segment@0/target-module@100000/ethernet@0/slave@300/mac-address"
[ -r "$mac_address" ] || exit 0

# Set the g_multi parameters
g_defaults="cdrom=0 stall=0 removable=1 nofua=1"

g_storage="file=/dev/${rootdrive}p1"

modprobe g_mass_storage ${g_storage} ${g_defaults}

