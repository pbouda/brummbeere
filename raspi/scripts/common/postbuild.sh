#!/bin/bash

echo "Install binary firmware..."
mkdir -p $1/lib/firmware/rtlwifi/
install ../userland/target/rtl8188eufw.bin $1/lib/firmware/rtlwifi/

echo "Install network and wpa_supplicant config..."
mkdir -p $1/etc/wpa_supplicant/
install ../userland/target/wpa_supplicant-wlan0.conf $1/etc/wpa_supplicant/
install ../userland/target/00-eth0-dhcp.network $1/etc/systemd/network/
install ../userland/target/01-wlan0-dhcp.network $1/etc/systemd/network/

echo "Install systemd targets and services..."
mkdir -p $1/etc/systemd/system/brummbeere.target.wants/
install ../userland/target/brummbeere.target $1/etc/systemd/system/
install ../userland/target/brummbeere.service $1/etc/systemd/system/
install -m 755 ../userland/target/brummbeere.sh $1/usr/bin/

ln -fs ../brummbeere.service $1/etc/systemd/system/brummbeere.target.wants/brummbeere.service
ln -fs ../../../../lib/systemd/system/systemd-modules-load.service $1/etc/systemd/system/multi-user.target.wants/systemd-modules-load.service
ln -fs ../../../../usr/lib/systemd/system/wpa_supplicant@.service $1/etc/systemd/system/multi-user.target.wants/wpa_supplicant@wlan0.service
ln -fs brummbeere.target $1/etc/systemd/system/default.target
rm -f $1/etc/systemd/system/multi-user.target.wants/remote-fs.target

echo "Copy config..."
mkdir -p $1/root/.config/Brummbeere/
install ../userland/target/Brummbeere.conf $1/root/.config/Brummbeere/

