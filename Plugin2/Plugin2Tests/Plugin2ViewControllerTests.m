@import XCTest;
#import "Plugin2ViewController.h"

@interface Plugin2ViewControllerTests : XCTestCase
@property (nonatomic) Plugin2ViewController *subject;
@end

@implementation Plugin2ViewControllerTests

- (void)setUp {
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Plugin2" bundle:[NSBundle bundleForClass:self.class]];
    self.subject = [storyboard instantiateInitialViewController];
}

- (void)testHasTabBarItemImage {
    XCTAssertNotNil(self.subject.tabBarItem.image, @"Missing tab bar item image");
}

- (void)testViewHasOpaqueBackgroundColor {
    CGFloat alpha;
    XCTAssertTrue([self.subject.view.backgroundColor getRed:NULL green:NULL blue:NULL alpha:&alpha]);
    XCTAssertEqual(alpha, 1);
}

@end
