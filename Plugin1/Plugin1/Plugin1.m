#import "Plugin1.h"
#import "Plugin1ViewController.h"

@implementation Plugin1

- (UIViewController *)rootViewController {
    // Vend our content! Note that the plugin has no dependency on the
    // host app whatsoever.
    return [Plugin1ViewController new];
}

@end
