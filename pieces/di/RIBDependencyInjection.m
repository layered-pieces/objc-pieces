//
//  RIBDependencyInjection.m
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import "RIBDependencyInjection.h"
#import "runtime.h"

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

static NSMutableDictionary<NSString *, NSArray<NSString *> *> *_dependencyGraph = nil;

@implementation RIBDependencyInjection

+ (void)initialize
{
    _dependencyGraph = [NSMutableDictionary dictionary];
    
    [self addDependencyPath:UIViewController.class properties:@[ NSStringFromSelector(@selector(parentViewController)), NSStringFromSelector(@selector(presentingViewController)) ]];
    [self addDependencyPath:UIResponder.class properties:@[ NSStringFromSelector(@selector(nextResponder)) ]];
}

+ (NSDictionary<NSString *, NSArray<NSString *> *> *)dependencyGraph
{
    @synchronized (self) {
        return _dependencyGraph.copy;
    }
}

+ (void)setDependencyGraph:(NSDictionary<NSString *,NSArray<NSString *> *> *)dependencyGraph
{
    @synchronized (self) {
        [_dependencyGraph removeAllObjects];
        [_dependencyGraph addEntriesFromDictionary:dependencyGraph];
    }
    
    [self _validateDependencyGraph];
}

+ (void)addDependencyPath:(Class)klass properties:(NSArray<NSString *> *)properties
{
    @synchronized (self) {
        NSMutableArray<NSString *> *leafs = [NSMutableArray arrayWithArray:_dependencyGraph[NSStringFromClass(klass)]];
        [leafs addObjectsFromArray:properties];
        _dependencyGraph[NSStringFromClass(klass)] = leafs;
    }
    
    [self _validateDependencyGraph];
}

+ (void)_validateDependencyGraph
{
    [[self dependencyGraph] enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSArray<NSString *> * _Nonnull obj, BOOL * _Nonnull stop) {
        assert(NSClassFromString(key) != Nil);
        
        for (NSString *property in obj) {
            assert([NSClassFromString(key) instanceMethodForSelector:NSSelectorFromString(property)] != NULL);
        }
    }];
}

@end


@implementation UIViewController (RIBDependencyInjection)

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if ([self resolveInjectedProperty:sel]) {
        return YES;
    }

    return [super resolveInstanceMethod:sel];
}

@end


@implementation NSObject (RIBDependencyInjection)

+ (BOOL)resolveInjectedProperty:(SEL)selector
{
    if ([NSStringFromSelector(selector) containsString:@":"] || rib_classIsBlacklisted(self)) {
        return NO;
    }
    
    objc_property_t objcProperty = class_getProperty(self, sel_getName(selector));
    
    char *rawType = property_copyAttributeValue(objcProperty, "T");
    char *rawDynamic = property_copyAttributeValue(objcProperty, "D");
    
    if (rawDynamic != NULL) {
        free(rawDynamic);
    }
    
    if (rawType != NULL && rawType[0] == '@') {
        free(rawType);
        
        if (rawDynamic != NULL) {
            NSString *getter = @(property_getName(objcProperty));
            IMP implemetation = imp_implementationWithBlock(^id(id self) {
                return rib_resolveDependency(self, getter);
            });
            
            return class_addMethod(self, NSSelectorFromString(getter), implemetation, "@@:");
        }
    }
    
    return NO;
}

@end
