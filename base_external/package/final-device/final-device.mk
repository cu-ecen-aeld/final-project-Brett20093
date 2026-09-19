##############################################################
#
# DEVICE
#
##############################################################

FINAL_DEVICE_VERSION = 5581f9bd53f1f606f79dfef8f73a7350e8356fb6
FINAL_DEVICE_SITE = git@github.com:Brett20093/ECEA-5307-Final-Project-Devices.git
FINAL_DEVICE_SITE_METHOD = git
FINAL_DEVICE_GIT_SUBMODULES = YES
FINAL_DEVICE_MODULE_SUBDIRS = reed-switch freezer-monitor lcd

# Build
define FINAL_DEVICE_BUILD_CMDS
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/reed-switch $(LINUX_MAKE_FLAGS) modules
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/lcd $(LINUX_MAKE_FLAGS) modules
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="-O0 -g -Wall -Werror -Wno-format-truncation -I$(@D)/lcd" -C $(@D)/freezer-monitor all
endef

# Install
define FINAL_DEVICE_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/reed-switch/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/lcd/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/freezer-monitor/freezer_monitor $(TARGET_DIR)/usr/bin
    $(INSTALL) -m 0755 $(@D)/freezer-monitor/freezermonitor.service $(TARGET_DIR)/etc/systemd/system/freezermonitor.service
endef

$(eval $(kernel-module))
$(eval $(generic-package))
