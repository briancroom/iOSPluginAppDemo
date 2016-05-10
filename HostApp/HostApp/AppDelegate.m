#import "AppDelegate.h"
#import "PluginLoader.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    NSMutableArray *viewControllers = [NSMutableArray array];
    for (Class class in [PluginLoader pluginPrincipalClasses]) {
        id<AppPlugin> plugin = [[class alloc] init];
        [viewControllers addObject:[plugin rootViewController]];
    }
    [viewControllers sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]]];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = viewControllers;
    self.window.rootViewController = tabBarController;

    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
