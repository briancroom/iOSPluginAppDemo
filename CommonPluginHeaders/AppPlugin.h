#import <UIKit/UIKit.h>

/// This header file defines a common protocol that all plugins should adopt. It
/// is used both for discovering available plugins, as well as defining the mechanism
/// for plugins to vend their content to the app in a generic fashion. In a more
/// complicated example, a delegate could also be included, as one way to enable
/// two-way communication between a plugin and the host app.
@protocol AppPlugin

/// Plugins should provide a view controller to be included in the app by
/// implementing this method on their principal class and returning a view
/// controller that displays the plugin's content.
- (UIViewController *)rootViewController;

@end
