DEBUG = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AWE
AWE_FILES = Tweak.xm
AWE_LIBRARIES = MobileGestalt

include $(THEOS_MAKE_PATH)/tweak.mk