THEOS_DEVICE_IP = 192.168.10.106
ARCHS = armv7 arm64
TARGET = iphone:9.2
include /opt/theos/makefiles/common.mk

TWEAK_NAME = EasySpring
EasySpring_FILES = Tweak.xm
EasySpring_LIBRARIES = activator
EasySpring_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += easyspring
include $(THEOS_MAKE_PATH)/aggregate.mk
