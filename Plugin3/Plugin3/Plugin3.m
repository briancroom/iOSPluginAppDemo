#import "Plugin3.h"

@implementation Plugin3

- (UIViewController *)rootViewController {
    UIViewController *vc = [UIViewController new];
    vc.title = @"Another!";
    vc.view.backgroundColor = [UIColor cyanColor];

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(40, 40), NO, [UIScreen mainScreen].scale);

    [[UIColor whiteColor] set];
    [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(5, 5, 30, 30) cornerRadius:5] fill];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    vc.tabBarItem.image = image;

    return vc;
}

@end
