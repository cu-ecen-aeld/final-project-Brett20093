#!/bin/sh
# Shared definitions for buildroot scripts

# The defconfig from the buildroot directory we use for qemu builds
QEMU_DEFCONFIG=configs/qemu_aarch64_virt_defconfig
# The place we store customizations to the qemu configuration
MODIFIED_QEMU_DEFCONFIG=base_external/configs/qemu_defconfig

# The defconfig from the buildroot directory we use for raspberry pi builds
RASP_DEFCONFIG=configs/raspberrypi4_64_defconfig
# The place we store customizations to the raspberry pi configuration
MODIFIED_RASP_DEFCONFIG=base_external/configs/raspberry_defconfig

# The defconfig from the buildroot directory we use for the project
DEFAULT_DEFCONFIG=${RASP_DEFCONFIG}
MODIFIED_DEFCONFIG=${MODIFIED_RASP_DEFCONFIG}
MODIFIED_DEFCONFIG_REL_BUILDROOT=../${MODIFIED_DEFCONFIG}
