#import "PluginLoader.h"

@implementation PluginLoader

+ (NSArray *)pluginPrincipalClasses {
    NSMutableArray *classes = [NSMutableArray array];
    for (NSBundle *bundle in [NSBundle allFrameworks]) {
        if ([bundle.principalClass conformsToProtocol:@protocol(AppPlugin)]) {
            [classes addObject:bundle.principalClass];
        }
    }
    return classes;
}

@end
