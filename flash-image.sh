#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
sudo dd if=$SCRIPT_DIR/buildroot/output/images/sdcard.img of=$1 bs=4M status=progress oflag=direct && sync