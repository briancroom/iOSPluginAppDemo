#import <UIKit/UIKit.h>

// Import the shared header which defines the common interface that plugins
// must adopt.
#import "AppPlugin.h"

/// Note that `Plugin1` is set in the `Info.plist` to be the principal class
/// of this plugin bundle.
@interface Plugin1: NSObject <AppPlugin>
@end
