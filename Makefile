GO_EASY_ON_ME = 1
SDKVERSION = 7.0
ARCHS = armv7

include theos/makefiles/common.mk
TWEAK_NAME = AWE
AWE_FILES = Tweak.xm
AWE_LIBRARIES = MobileGestalt

include $(THEOS_MAKE_PATH)/tweak.mk

