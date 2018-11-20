//
//  runtime.m
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import "runtime.h"

#import "RIBDependencyGraph.h"
#import "RIBDependencyContainer.h"

#import <objc/runtime.h>

@interface RIBDependencyGraph (runtime)

- (BOOL)object:(id<RIBDependencyContainer>)object listensForDependency:(NSString *)dependency;
- (BOOL)object:(id<RIBDependencyContainer>)object implementsDependency:(NSString *)dependency ofType:(NSString *)type;

- (NSArray<id<RIBDependencyContainer>> *)childrenForObject:(id)object;
- (NSArray<id<RIBDependencyContainer>> *)parentsForObject:(id)object;

@end

@implementation RIBDependencyGraph (runtime)

- (BOOL)object:(id<RIBDependencyContainer>)object listensForDependency:(NSString *)dependency
{
    objc_property_t objcProperty = class_getProperty(object_getClass(object), dependency.UTF8String);
    if (objcProperty == NULL) {
        return NO;
    }

    return rib_propertyIsDynamic(object_getClass(object), dependency) && [self containsDependency:dependency type:rib_propertyCopyType(object_getClass(object), dependency)];
}

- (BOOL)object:(id<RIBDependencyContainer>)object implementsDependency:(NSString *)dependency ofType:(NSString *)type
{
    objc_property_t objcProperty = class_getProperty(object_getClass(object), dependency.UTF8String);
    if (objcProperty == NULL) {
        return NO;
    }
    
    return !rib_propertyIsDynamic(object_getClass(object), dependency) && [rib_propertyCopyType(object_getClass(object), dependency) isEqualToString:type];
}

- (NSArray<id<RIBDependencyContainer>> *)childrenForObject:(id)object
{
    NSMutableArray *result = [NSMutableArray array];
    void(^appendChildren)(id children) = ^(id children) {
        if (children == nil) {
            return;
        }
        
        if ([children isKindOfClass:NSArray.class]) {
            [result addObjectsFromArray:children];
        } else {
            [result addObject:children];
        }
    };
    
    Class klass = object_getClass(object);
    while (rib_classConformsToProtocol(klass, @protocol(RIBDependencyContainer))) {
        for (NSString *child in self.graph[NSStringFromClass(klass)].children) {
            appendChildren([object valueForKey:child]);
        }
        
        klass = class_getSuperclass(klass);
    }
    
    return result;
}

- (NSArray<id<RIBDependencyContainer>> *)parentsForObject:(id)object
{
    NSMutableArray *result = [NSMutableArray array];
    void(^appendChildren)(id children) = ^(id children) {
        if (children == nil) {
            return;
        }

        if ([children isKindOfClass:NSArray.class]) {
            [result addObjectsFromArray:children];
        } else {
            [result addObject:children];
        }
    };
    
    Class klass = object_getClass(object);
    while (rib_classConformsToProtocol(klass, @protocol(RIBDependencyContainer))) {
        if (self.graph[NSStringFromClass(klass)].parent != nil) {
            appendChildren([object valueForKey:self.graph[NSStringFromClass(klass)].parent]);
        }
        
        klass = class_getSuperclass(klass);
    }
    
    return result;
}

@end

#pragma mark - runtime helpers

BOOL rib_propertyIsDynamic(Class klass, NSString *property)
{
    objc_property_t objcProperty = class_getProperty(klass, property.UTF8String);
    assert(objcProperty != NULL);
    
    char *dynamic = property_copyAttributeValue(objcProperty, "D");
    if (dynamic != NULL) { free(dynamic); }
    
    return dynamic != NULL;
}

NSString *rib_propertyCopyType(Class klass, NSString *property)
{
    objc_property_t objcProperty = class_getProperty(klass, property.UTF8String);
    assert(objcProperty != NULL);
    
    char *type = property_copyAttributeValue(objcProperty, "T");
    assert(type != NULL);
    
    NSString *stringedType = [[NSString alloc] initWithUTF8String:type];
    free(type);
    
    return stringedType;
}

BOOL rib_classConformsToProtocol(Class klass, Protocol *protocol)
{
    Class foundClass = klass;
    
    while (foundClass != Nil) {
        if (class_conformsToProtocol(foundClass, @protocol(RIBDependencyContainer))) {
            break;
        }
        
        foundClass = class_getSuperclass(foundClass);
    }
    
    return foundClass != Nil;
}

#pragma mark - dependency resolution

void rib_dependencyDidChange(id<RIBDependencyContainer> object, NSString *property)
{
    RIBDependencyGraph *deprendencyGraph = [object.class dependencyGraph];
    
    if ([deprendencyGraph object:object listensForDependency:property]) {
        [object rib_injectedDependencyDidChange:property];
    }
    
    for (id<RIBDependencyContainer> child in [deprendencyGraph childrenForObject:object]) {
        rib_dependencyDidChange(child, property);
    }
}

id _Nullable _rib_resolveDependency(id<RIBDependencyContainer> object, NSString *property, NSString *type, RIBDependencyGraph *deprendencyGraph, BOOL *found)
{
    if ([deprendencyGraph object:object implementsDependency:property ofType:type]) {
        if (found != NULL) {
            *found = YES;
        }
        
        return [(id)object valueForKey:property];
    }
    
    for (id<RIBDependencyContainer> parent in [deprendencyGraph parentsForObject:object]) {
        BOOL didFind = NO;
        id value = _rib_resolveDependency(parent, property, type, deprendencyGraph, &didFind);
        
        if (didFind) {
            if (found != NULL) {
                *found = YES;
            }
            
            return value;
        }
    }
    
    return nil;
}

id _Nullable rib_resolveDependency(id<RIBDependencyContainer> object, NSString *property, NSString *type)
{
    return _rib_resolveDependency(object, property, rib_propertyCopyType(object_getClass(object), property), [object.class dependencyGraph], NULL);
}

BOOL rib_implementDependencyObserver(Class klass, NSString *dependency)
{
    assert([rib_propertyCopyType(klass, dependency) hasPrefix:@"@"]);
    
    SEL setter = NSSelectorFromString([NSString stringWithFormat:@"set%@%@:", [dependency substringToIndex:1].uppercaseString, [dependency substringFromIndex:1]]);
    IMP originalImplementation = method_getImplementation(class_getInstanceMethod(klass, setter));
    
    IMP swizzledImplementation = imp_implementationWithBlock(^(id self, id value) {
        id oldValue = [self valueForKey:dependency];
        ((void(*)(id, SEL, id))originalImplementation)(self, setter, value);
        id newValue = [self valueForKey:dependency];
        
        if (oldValue == newValue || [oldValue isEqual:newValue]) {
            return;
        }
        
        rib_dependencyDidChange(self, dependency);
    });
    
    return class_replaceMethod(klass, setter, swizzledImplementation, "v@:@") != NULL;
}

#pragma mark - property injection

void rib_implementInjectedPropertiesInImage(NSString *image)
{
    unsigned int count = 0;
    const char **classes = objc_copyClassNamesForImage(image.UTF8String, &count);
    
    // initialize all classes
    for (unsigned int i = 0; i < count; i++) {
        (void)[NSClassFromString(@(classes[i])) class];
    }
    
    for (unsigned int i = 0; i < count; i++) {
        Class klass = NSClassFromString(@(classes[i]));

        if (!rib_classConformsToProtocol(klass, @protocol(RIBDependencyContainer))) {
            continue;
        }
        
        RIBDependencyGraph *dependencyGraph = [klass dependencyGraph];
        
        unsigned int count = 0;
        objc_property_t *properties = class_copyPropertyList(klass, &count);
        
        for (unsigned int i = 0; i < count; i++) {
            NSString *property = @(property_getName(properties[i]));
            
            if (rib_propertyIsDynamic(klass, property) && [dependencyGraph containsDependency:property type:rib_propertyCopyType(klass, property)]) {
                rib_implementInjectedProperty(klass, property);
            }
        }
    }
}

BOOL rib_implementInjectedProperty(Class klass, NSString *property)
{
    assert(rib_classConformsToProtocol(klass, @protocol(RIBDependencyContainer)));
    
    NSString *type = rib_propertyCopyType(klass, property);
    assert(rib_propertyIsDynamic(klass, property));
    
    RIBDependencyGraph *dependencyGraph = [klass dependencyGraph];
    assert([dependencyGraph containsDependency:property type:type]);
    
    IMP implementation = imp_implementationWithBlock(^id(id self) {
        return rib_resolveDependency(self, property, type);
    });
    
    return class_addMethod(klass, NSSelectorFromString(property), implementation, "@@:");
}
