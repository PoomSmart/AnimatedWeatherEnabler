#import <Foundation/Foundation.h>

@interface BKSApplicationLaunchSettings : NSObject
- (NSDictionary *)environment;
- (void)setEnvironment:(NSDictionary *)environment;
@end

@interface BKSApplicationActivationSettings : NSObject
- (BKSApplicationLaunchSettings *)launchSettings;
- (void)setLaunchSettings:(BKSApplicationLaunchSettings *)launchSettings;
@end

@interface BKApplication : NSObject
- (NSBundle *)bundle;
@end

%hook BKApplication

- (BOOL)launch:(BKSApplicationActivationSettings *)settings
{
	if ([[[self bundle] bundleIdentifier] isEqualToString:@"com.apple.weather"]) {
		NSDictionary *env = [[settings launchSettings] environment];
		NSMutableDictionary *dict = [env mutableCopy];
		[dict setObject:@"/usr/lib/InjectionAW.dylib" forKey:@"DYLD_INSERT_LIBRARIES"];
		[dict setObject:@"1" forKey:@"DYLD_FORCE_FLAT_NAMESPACE"];
		BKSApplicationLaunchSettings *newLaunchSettings = [settings launchSettings];
    	[newLaunchSettings setEnvironment:dict];
		[dict release];
		[settings setLaunchSettings:newLaunchSettings];
		return %orig(settings);
	}
	return %orig;
}

%end