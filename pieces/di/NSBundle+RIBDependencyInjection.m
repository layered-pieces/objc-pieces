//
//  NSBundle+RIBDependencyInjection.m
//  pieces
//
//  Created by Oliver Letterer on 03.11.18.
//

#import "NSBundle+RIBDependencyInjection.h"
#import "runtime.h"

#import <objc/runtime.h>

@implementation NSBundle (RIBDependencyInjection)

- (void)resolveDependenciesIncludingFrameworks:(BOOL)includeFrameworks
{
    if (includeFrameworks) {
        unsigned int count = 0;
        const char **images = objc_copyImageNames(&count);
        
        for (unsigned int i = 0; i < count; i++) {
            if ([@(images[i]) hasPrefix:self.bundlePath]) {
                rib_implementInjectedPropertiesInImage(@(images[i]));
            }
        }
        
        free(images);
    } else {
        rib_implementInjectedPropertiesInImage(self.executablePath);
    }
}

@end
