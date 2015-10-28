#import <Cedar/Cedar.h>
#import "InterfaceController.h"
#import "WatchSessionManager.h"

#import "PCKInterfaceControllerLoader.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(InterfaceControllerSpec)

describe(@"InterfaceController", ^{
    __block InterfaceController *subject;
    __block WatchSessionManager *watchSessionManager;
    
    beforeEach(^{
        /*
         This is an iOS testing target and Xcode 7 does not allow iOS to compile any watch storyboards. Thus to be able to instantiate view controllers from storyboards in your testing target, you will need a product built by Xcode accessible by your watch testing target. This can be achieved by adding a new ‘Copy File phase’ in Build Phases for the test target. Then  use the function below to direcly reference the copied bundle and load the view controller.
         
         */
        subject = [[PCKInterfaceControllerLoader new] interfaceControllerWithStoryboardName:@"Interface"
                                                                                 identifier:NSStringFromClass([InterfaceController class])
                                                                                     bundle:[NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"WatchTDDDemoWatchApp"
                                                                                                                                            withExtension:@"app"]]];
        
        watchSessionManager = [WatchSessionManager sharedInstance];
        
        [subject awakeWithContext:nil];
        [subject willActivate];
    });
    
    
    context(@"when it recieves a new context", ^{
        __block NSDictionary *context;
        beforeEach(^{
            spy_on(watchSessionManager);
            context = @{@"text" : @"testText"};
            [watchSessionManager.delegate recievedNewContext:context];
        });
        
        afterEach(^{
            stop_spying_on(watchSessionManager);
        });
        
        it(@"should update the label", ^{
            subject.label.text should equal(@"testText");
        });
    });
});

SPEC_END
