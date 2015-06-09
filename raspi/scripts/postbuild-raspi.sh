#!/bin/bash

../scripts/common/postbuild.sh $1

#echo "Install module load and options..."
#install ../userland/target/tft.conf $1/etc/modules-load.d/
#install ../userland/target/sound.conf $1/etc/modules-load.d/
#install ../userland/target/tft-options.conf $1/etc/modprobe.d/tft.conf

echo "Install apps..."
install -m 755 ../userland/target/raspi/brummbeere $1/usr/bin/
install -m 755 ../userland/target/raspi/fbcp $1/usr/bin/
