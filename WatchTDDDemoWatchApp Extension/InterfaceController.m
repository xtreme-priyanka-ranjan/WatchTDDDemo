
#import "InterfaceController.h"
#import "WatchSessionManager.h"

@interface InterfaceController() <WatchSessionManagerDelegate>

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *helloPhoneButton;
@property (unsafe_unretained, nonatomic) NSString *recievedMessage;

@end

@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [WatchSessionManager sharedInstance].delegate = self;
}

- (IBAction)helloPhoneButtonTapped {
    NSString *response = [NSString stringWithFormat:@"%@ - WatchTDDApp",
                          self.recievedMessage.length > 0 ? self.recievedMessage : @"Please send a message."];
    [[WatchSessionManager sharedInstance] updateApplicationContext:@{@"text" : response}];
}


#pragma mark - <WatchSessionManagerDelegate>

- (void)recievedNewContext:(NSDictionary *)context {
    NSString *text = [context objectForKey:@"text"];
    [self.label setText:text];
    self.recievedMessage = text;
}

@end



