#import "Plugin1ViewController.h"

@implementation Plugin1ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"One";

        // Note that both Plugin1 and Plugin2 each have an asset catalog resource
        // with the same name, containing an image with the same name, but all
        // resources are embedded within each plugin bundle, so there is no
        // conflict or need for explicit namespacing, although it is necessary
        // to indicate which bundle contains the desired resource.
        self.tabBarItem.image = [UIImage imageNamed:@"icon"
                                           inBundle:[NSBundle bundleForClass:self.class]
                      compatibleWithTraitCollection:nil];
    }
    return self;
}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor magentaColor];
}

@end
