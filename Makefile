GO_EASY_ON_ME = 1

include theos/makefiles/common.mk

AGGREGATE_NAME = AnimatedWeatherEnabler
SUBPROJECTS = BackBoardHookAW InjectionAW

include $(THEOS_MAKE_PATH)/aggregate.mk
