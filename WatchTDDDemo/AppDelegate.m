

#import "AppDelegate.h"
#import "WatchConnectivity.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[WatchConnectivity sharedInstance] setup];
    return YES;
}

@end
