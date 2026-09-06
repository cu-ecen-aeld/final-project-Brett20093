#!/bin/bash
#Script to run QEMU for buildroot project (qemu v11.0.4)
#Author: Brett Lange

qemu-img resize buildroot/output/images/sdcard.img 256M
qemu-img resize buildroot/output/images/Image 4G

qemu-system-aarch64 \
    -machine raspi4b  \
    -cpu cortex-a72 \
    -m 2G \
    -smp 4 \
    -kernel buildroot/output/images/Image \
    -dtb buildroot/output/images/bcm2711-rpi-4-b.dtb \
    -drive file=buildroot/output/images/sdcard.img,if=sd,format=raw \
    -append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 root=/dev/mmcblk0p2 rootwait" \
    -nographic
