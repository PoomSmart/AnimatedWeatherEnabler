#import <substrate.h>

extern "C" CFPropertyListRef MGCopyAnswer(CFStringRef);
%hookf(CFPropertyListRef, MGCopyAnswer, CFStringRef key)
{
	if (CFEqual(key, CFSTR("ProductType")))
		return CFSTR("iPhone6,1");
    return %orig;
}