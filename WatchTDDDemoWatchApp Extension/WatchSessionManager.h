

#import <Foundation/Foundation.h>

@protocol WatchSessionManagerDelegate <NSObject>
- (void)recievedNewContext:(NSDictionary *)context;
@end

@interface WatchSessionManager : NSObject

+ (instancetype)sharedInstance;
- (void)setup;
- (void)updateApplicationContext:(NSDictionary *)context;

@property (nonatomic, weak) id<WatchSessionManagerDelegate> delegate;

@end
