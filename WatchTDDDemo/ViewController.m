

#import "ViewController.h"
#import "WatchConnectivity.h"

@interface ViewController () <WatchConnectivityProtocol, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *texfield;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [WatchConnectivity sharedInstance].delegate = self;
}


#pragma mark - IBActions

- (IBAction)helloWatchButtonTapped:(id)sender {
    if (self.texfield.text.length > 0) {
        [[WatchConnectivity sharedInstance] updateApplicationContext:@{
                                                                       @"text" : self.texfield.text
                                                                    }];
    }
}


#pragma mark - <WatchConnectivityProtocol>

- (void)recievedNewContext:(NSDictionary *)context {
    NSString *text = [context objectForKey:@"text"];
    self.label.text = [NSString stringWithFormat:@"Response from watch: %@", text ];
}


#pragma mark - <UITextFieldDelegate>

- (BOOL)textFieldShouldReturn:(nonnull UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


@end
