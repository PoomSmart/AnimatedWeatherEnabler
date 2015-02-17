#import <substrate.h>

extern "C" CFPropertyListRef MGCopyAnswer(CFStringRef);
MSHook(CFPropertyListRef, MGCopyAnswer, CFStringRef key)
{
	if (CFEqual(key, CFSTR("ProductType")))
		return CFSTR("iPhone6,1");
    return _MGCopyAnswer(key);
}

%ctor
{
	MSHookFunction(MGCopyAnswer, MSHake(MGCopyAnswer));
}

