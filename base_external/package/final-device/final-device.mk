##############################################################
#
# DEVICE
#
##############################################################

FINAL_DEVICE_VERSION = 714d580c5a9b4532b9ead910b0035f045044d0e4
FINAL_DEVICE_SITE = git@github.com:Brett20093/ECEA-5307-Final-Project-Devices.git
FINAL_DEVICE_SITE_METHOD = git
FINAL_DEVICE_GIT_SUBMODULES = YES
FINAL_DEVICE_MODULE_SUBDIRS = reed-switch freezer-monitor lcd

# Build
define FINAL_DEVICE_BUILD_CMDS
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/reed-switch $(LINUX_MAKE_FLAGS) modules
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/lcd $(LINUX_MAKE_FLAGS) modules
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="-O0 -g -Wall -Werror -I$(@D)/lcd" -C $(@D)/freezer-monitor all
endef

# Install
define FINAL_DEVICE_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/reed-switch/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/lcd/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/freezer-monitor/freezer_monitor $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
