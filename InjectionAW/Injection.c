#import <substrate.h>
#import <CoreFoundation/CoreFoundation.h>

#define DYLD_INTERPOSE(_replacment,_replacee) \
   __attribute__((used)) static struct{ const void* replacment; const void* replacee; } _interpose_##_replacee \
            __attribute__ ((section ("__DATA,__interpose"))) = { (const void*)(unsigned long)&_replacment, (const void*)(unsigned long)&_replacee };

CFTypeRef MGCopyAnswer(CFStringRef KeyToCopy, int __unknown);

CFTypeRef _MGCopyAnswer(CFStringRef KeyToCopy, int __unknown)
{
	CFTypeRef ReturnData;
    if (!CFStringCompare(KeyToCopy, CFSTR("ProductType"), 0))
        return CFSTR("iPhone5,1");
    ReturnData = MGCopyAnswer(KeyToCopy, __unknown);
    return ReturnData;
}

DYLD_INTERPOSE(_MGCopyAnswer, MGCopyAnswer)

int main () {
	return 0;
}