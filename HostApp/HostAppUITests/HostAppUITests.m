@import XCTest;

@interface HostAppUITests : XCTestCase
@property (nonatomic) XCUIApplication *app;
@end

@implementation HostAppUITests

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    self.app = [[XCUIApplication alloc] init];
    [self.app launch];
}

- (void)testPopulatesTabBarWithPluginViewControllers {
    XCUIElementQuery *tabBarItemsQuery = self.app.tabBars.buttons;
    XCTAssertTrue(tabBarItemsQuery[@"Another!"].exists);
    XCTAssertTrue(tabBarItemsQuery[@"One"].exists);
    XCTAssertTrue(tabBarItemsQuery[@"Two"].exists);
}

@end
