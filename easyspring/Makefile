ARCHS = armv7 arm64
include /opt/theos/makefiles/common.mk

BUNDLE_NAME = EasySpring

EasySpring_FILES = EasySpring.mm PFHeaderCell.mm

EasySpring_INSTALL_PATH = /Library/PreferenceBundles
EasySpring_FRAMEWORKS = UIKit
EasySpring_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/EasySpring.plist$(ECHO_END)
