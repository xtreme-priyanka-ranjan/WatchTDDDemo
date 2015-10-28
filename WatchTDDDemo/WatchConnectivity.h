

#import <Foundation/Foundation.h>

@protocol WatchConnectivityProtocol <NSObject>
- (void)recievedNewContext:(NSDictionary *)context;
@end


@interface WatchConnectivity : NSObject

+ (instancetype)sharedInstance;
- (void)setup;
- (void)updateApplicationContext:(NSDictionary *)context;
- (NSDictionary *)receivedApplicationContext;

@property (nonatomic, weak) id<WatchConnectivityProtocol> delegate;

@end
