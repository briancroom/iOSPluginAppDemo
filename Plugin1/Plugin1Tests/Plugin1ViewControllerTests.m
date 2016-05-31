@import XCTest;
@import Plugin1Framework;

@interface Plugin1ViewControllerTests : XCTestCase
@property (nonatomic) Plugin1ViewController *subject;
@end

@implementation Plugin1ViewControllerTests

- (void)setUp {
    [super setUp];
    self.subject = [[Plugin1ViewController alloc] initWithNibName:nil bundle: nil];
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
