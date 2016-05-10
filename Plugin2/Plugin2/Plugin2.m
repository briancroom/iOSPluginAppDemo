#import "Plugin2.h"
#import "Plugin2ViewController.h"

@implementation Plugin2

- (UIViewController *)rootViewController {
    // This plugin demonstrates loading its root view controller from a storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Plugin2" bundle:[NSBundle bundleForClass:self.class]];
    return [storyboard instantiateInitialViewController];
}

@end
