#import <UIKit/UIKit.h>
#import "AppPlugin.h"

/// This class encapsulates the behavior of dynamically discovering plugins which
/// have been bundled with the app.
@interface PluginLoader : NSObject

/// Returns an array of classes which implement the `AppPlugin` protocol, each
/// of which is the principal class of a plugin bundle. Plugins can be disabled
/// by adding an Info.plist key `PluginEnabled` with a value of NO.
+ (NSArray<Class<AppPlugin>> *)pluginPrincipalClasses;

@end
