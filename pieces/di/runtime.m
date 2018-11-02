//
//  runtime.m
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import "runtime.h"
#import "RIBDependencyInjection.h"

#import <objc/runtime.h>

id _rib_resolveDependency(id object, Class klass, NSString *property, BOOL throwOnNotFound);
BOOL _rib_canResolveDependency(id object, Class klass, NSString *property);

BOOL rib_classIsBlacklisted(Class klass)
{
    NSBundle *bundle = [NSBundle bundleForClass:klass];
    return [bundle.bundlePath.lowercaseString containsString:@"system"];
}

BOOL rib_canResolveDependency(id object, NSString *property)
{
    return _rib_canResolveDependency(object, object_getClass(object), property);
}

BOOL _rib_canResolveDependency(id object, Class klass, NSString *property)
{
    if (rib_classIsBlacklisted(klass)) {
        return NO;
    }
    
    NSDictionary<NSString *, NSArray<NSString *> *> *dependencyGraph = RIBDependencyInjection.dependencyGraph;
    
    objc_property_t objcProperty = class_getProperty(klass, property.UTF8String);
    if (objcProperty != NULL) {
        char *rawType = property_copyAttributeValue(objcProperty, "T");
        char *rawDynamic = property_copyAttributeValue(objcProperty, "D");
        
        if (rawDynamic != NULL) {
            free(rawDynamic);
        }
        
        if (rawType != NULL && rawType[0] == '@') {
            free(rawType);
            
            if (rawDynamic == NULL) {
                return YES;
            }
        }
    }
    
    for (NSString *parentProperty in dependencyGraph[NSStringFromClass(klass)]) {
        id parent = [object valueForKey:parentProperty];
        
        if (parent != nil && _rib_canResolveDependency(parent, object_getClass(parent), property)) {
            return YES;
        }
    }
    
    Class superKlass = class_getSuperclass(klass);
    if (superKlass != Nil) {
        if (_rib_canResolveDependency(object, superKlass, property)) {
            return YES;
        }
    }
    
    return NO;
}

id rib_resolveDependency(id object, NSString *property)
{
    NSString *klass = NSStringFromClass([object class]);
    return _rib_resolveDependency(object, object_getClass(object), property, RIBDependencyInjection.dependencyGraph[klass].count == 0);
}

id _rib_resolveDependency(id object, Class klass, NSString *property, BOOL throwOnNotFound)
{
    NSDictionary<NSString *, NSArray<NSString *> *> *dependencyGraph = RIBDependencyInjection.dependencyGraph;
    
    objc_property_t objcProperty = class_getProperty(klass, property.UTF8String);
    if (objcProperty != NULL) {
        char *rawType = property_copyAttributeValue(objcProperty, "T");
        char *rawDynamic = property_copyAttributeValue(objcProperty, "D");
        
        if (rawDynamic != NULL) {
            free(rawDynamic);
        }
        
        if (rawType != NULL && rawType[0] == '@') {
            free(rawType);
            
            if (rawDynamic == NULL) {
                return [object valueForKey:property];
            }
        }
    }
    
    for (NSString *parentProperty in dependencyGraph[NSStringFromClass(klass)]) {
        id parent = [object valueForKey:parentProperty];
        
        if (parent != nil) {
            id result = _rib_resolveDependency(parent, object_getClass(parent), property, NO);
            
            if (result != nil) {
                return result;
            }
        }
    }
    
    Class superKlass = class_getSuperclass(klass);
    if (superKlass != Nil) {
        id result = _rib_resolveDependency(object, superKlass, property, YES);
        
        if (result != nil) {
            return result;
        }
    }
    
    if (throwOnNotFound) {
        assert(false);
    }
    
    return nil;
}
