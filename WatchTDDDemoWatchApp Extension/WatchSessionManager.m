

#import "WatchSessionManager.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface WatchSessionManager () <WCSessionDelegate>
@end

@implementation WatchSessionManager

+ (instancetype)sharedInstance {
    static WatchSessionManager *sharedInstance;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [WatchSessionManager new];
    });
    return sharedInstance;
}

- (void)setup {
    WCSession *session = [WCSession defaultSession];
    session.delegate = self;
    [session activateSession];
}

- (void)updateApplicationContext:(NSDictionary *)context {
    WCSession *session = [WCSession defaultSession];
    NSError *error;
    [session updateApplicationContext:context error:&error];
}

- (NSDictionary *)receivedApplicationContext {
    WCSession *session = [WCSession defaultSession];
    return session.receivedApplicationContext;
}

#pragma mark - <WCSessionDelegate>

- (void)session:(WCSession *)session didReceiveApplicationContext:(NSDictionary<NSString *, id> *)applicationContext {
    if ([self.delegate conformsToProtocol:@protocol(WatchSessionManagerDelegate)]) {
        [self.delegate recievedNewContext:applicationContext];
    }
}

@end
