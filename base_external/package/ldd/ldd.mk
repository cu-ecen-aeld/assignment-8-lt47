LDD_VERSION = b424272e1edd24e1a8747bf5a233caaf1e0da95e 
LDD_SITE = https://github.com/cu-ecen-aeld/assignment-7-lt47.git
LDD_SITE_METHOD = git
LDD_DEPENDENCIES = linux

define LDD_BUILD_CMDS
	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M="$(@D)/scull" EXTRA_CFLAGS="-I$(@D)/include" modules

	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M="$(@D)/misc-modules" EXTRA_CFLAGS="-I$(@D)/include" modules
endef


define LDD_INSTALL_TARGET_CMDS
	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) \
		M="$(@D)/scull" \
		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install

	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) \
		M="$(@D)/misc-modules" \
		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
endef
$(eval $(generic-package))
