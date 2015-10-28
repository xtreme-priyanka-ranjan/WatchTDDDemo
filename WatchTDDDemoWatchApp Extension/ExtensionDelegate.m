

#import "ExtensionDelegate.h"
#import "WatchSessionManager.h"

@interface ExtensionDelegate ()
@end

@implementation ExtensionDelegate

- (void)applicationDidFinishLaunching {
    [[WatchSessionManager sharedInstance] setup];
}


@end
