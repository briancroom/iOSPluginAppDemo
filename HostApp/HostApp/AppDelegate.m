#import "AppDelegate.h"
#import "PluginLoader.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = [self loadViewControllersFromPlugins];
    self.window.rootViewController = tabBarController;

    [self.window makeKeyAndVisible];
    
    return YES;
}

- (NSArray *)loadViewControllersFromPlugins {
    NSMutableArray *viewControllers = [NSMutableArray array];

    // For each plugin's principal class, create an instance and ask it for
    // a view controller to display.
    for (Class class in [PluginLoader pluginPrincipalClasses]) {
        id<AppPlugin> plugin = [[class alloc] init];
        [viewControllers addObject:[plugin rootViewController]];
    }
    [viewControllers sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]]];

    return [viewControllers copy];
}

@end
