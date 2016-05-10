#import "PluginLoader.h"

@implementation PluginLoader

+ (NSArray<Class<AppPlugin>> *)pluginPrincipalClasses {
    NSMutableArray *classes = [NSMutableArray array];

    for (NSURL *pluginURL in [[NSFileManager new] enumeratorAtURL:[[NSBundle mainBundle] builtInPlugInsURL]
              includingPropertiesForKeys:nil
                                 options:NSDirectoryEnumerationSkipsSubdirectoryDescendants|NSDirectoryEnumerationSkipsPackageDescendants
                                                     errorHandler:NULL]) {
        NSBundle *bundle = [NSBundle bundleWithURL:pluginURL];
        NSNumber *enabled = bundle.infoDictionary[@"PluginEnabled"];
        if (enabled != nil && ![enabled boolValue]) {
            continue;
        }

        [bundle load];

        if ([bundle.principalClass conformsToProtocol:@protocol(AppPlugin)]) {
            [classes addObject:bundle.principalClass];
        }
    }

    return classes;
}

@end
