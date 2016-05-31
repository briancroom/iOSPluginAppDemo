#import "PluginLoader.h"

@implementation PluginLoader

+ (NSArray<Class<AppPlugin>> *)pluginPrincipalClasses {
    NSMutableArray *classes = [NSMutableArray array];

    for (NSURL *pluginURL in [[NSFileManager new] enumeratorAtURL:[[NSBundle mainBundle] builtInPlugInsURL]
              includingPropertiesForKeys:nil
                                 options:NSDirectoryEnumerationSkipsSubdirectoryDescendants|NSDirectoryEnumerationSkipsPackageDescendants
                                                     errorHandler:NULL]) {
        NSBundle *bundle = [NSBundle bundleWithURL:pluginURL];
        if (![self isPluginEnabled:bundle]) {
            continue;
        }

        [bundle load];

        if ([bundle.principalClass conformsToProtocol:@protocol(AppPlugin)]) {
            [classes addObject:bundle.principalClass];
        }
    }

    return classes;
}

+ (BOOL)isPluginEnabled:(NSBundle *)plugin {
    NSNumber *enabled = plugin.infoDictionary[@"PluginEnabled"];
    if (enabled != nil && ![enabled boolValue]) {
        return NO;
    }

    NSString *pluginName = plugin.bundleURL.URLByDeletingPathExtension.lastPathComponent;
    NSArray *selectedPlugins = [[NSProcessInfo processInfo].environment[@"SELECTED_PLUGINS"] componentsSeparatedByString:@","];
    if (selectedPlugins.count > 0 && ![selectedPlugins containsObject:pluginName]) {
        return NO;
    }

    return YES;
}

@end
