#!/bin/bash

echo "Installing root fs..."
umount /dev/sdc1
umount /dev/sdc2
sudo mkfs.ext4 -i 1024 -L rootfs /dev/sdc2
sudo mount /dev/sdc2 /mnt
cd /mnt
sudo tar xvf $1/../images/rootfs.tar
cd $1
sudo umount /dev/sdc2

echo "Installing kernel..."
sudo mount /dev/sdc1 /mnt
../tools/mkimage/mkknlimg  $1/../images/zImage $1/../images/zImage.dt
sudo cp $1/../images/zImage.dt /mnt/kernel.img
sudo cp $1/../images/zImage.dt /mnt/kernel7.img
sudo umount /dev/sdc1
