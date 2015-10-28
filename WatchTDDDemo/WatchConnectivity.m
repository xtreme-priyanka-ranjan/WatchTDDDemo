

#import <WatchConnectivity/WatchConnectivity.h>
#import "WatchConnectivity.h"

@interface WatchConnectivity () <WCSessionDelegate>
@end

@implementation WatchConnectivity

+ (instancetype)sharedInstance {
    static WatchConnectivity *sharedInstance;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [WatchConnectivity new];
    });
    return sharedInstance;
}

- (void)setup {
    WCSession *session = [WCSession defaultSession];
    session.delegate = self;
    [session activateSession];
}

- (void)updateApplicationContext:(NSDictionary *)context {
    NSError *error;
    WCSession *session = [WCSession defaultSession];
    [session updateApplicationContext:context error:&error];
}

- (NSDictionary *)receivedApplicationContext {
    WCSession *session = [WCSession defaultSession];
    return session.receivedApplicationContext;
}


#pragma mark - <WCSessionDelegate>

- (void)session:(WCSession *)session didReceiveApplicationContext:(NSDictionary<NSString *,id> *)applicationContext {
    if ([self.delegate conformsToProtocol:@protocol(WatchConnectivityProtocol)]) {
        [self.delegate recievedNewContext:applicationContext];
    }
}

@end
