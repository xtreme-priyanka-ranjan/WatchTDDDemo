
/*
 This import is required to distiguish between the PivotalCoreKit "WatchKit.h"
 and Apples WatchKit framework. 
 
 #import <TargetCondiotionals.h> is required to set "TARGET_OS_WATCH".
 */


#import <TargetConditionals.h>
#if TARGET_OS_WATCH
#import <WatchKit/WatchKit.h> // Apple's WatchKit
#else
#import "WatchKit.h" // PCK's WatchKit
#endif

#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;

@end
