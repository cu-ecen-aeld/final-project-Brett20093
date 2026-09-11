##############################################################
#
# DEVICE
#
##############################################################

REED_SWITCH_DEVICE_VERSION = 1033a8d9899d5d6b6b505e9be41565e8231a5db5
REED_SWITCH_DEVICE_SITE = git@github.com:Brett20093/ECEA-5307-Final-Project-Devices.git
REED_SWITCH_DEVICE_SITE_METHOD = git
REED_SWITCH_DEVICE_GIT_SUBMODULES = YES
REED_SWITCH_DEVICE_MODULE_SUBDIRS = reed-switch

# Build
define REED_SWITCH_DEVICE_BUILD_CMDS
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/reed-switch $(LINUX_MAKE_FLAGS) modules
endef

# Install
define REED_SWITCH_DEVICE_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/reed-switch/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
endef

$(eval $(kernel-module))
$(eval $(generic-package))
