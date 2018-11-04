//
//  RIBDependencyInjection.m
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import "RIBDependencyGraph.h"
#import "runtime.h"

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@interface RIBDependencyNode ()

@property (nonatomic, strong) Class klass;

@property (nonatomic, nullable) NSString *parent;
@property (nonatomic, readonly) NSMutableOrderedSet<NSString *> *mutableChildren;

@end

@implementation RIBDependencyNode

- (NSOrderedSet<NSString *> *)children
{
    return self.mutableChildren.copy;
}

- (instancetype)init
{
    if (self = [super init]) {
        _mutableChildren = [[NSMutableOrderedSet alloc] init];
    }
    return self;
}

@end


@interface RIBDependency ()

@property (nonatomic, strong) Class klass;

@property (nonatomic, strong) NSString *property;
@property (nonatomic, strong) NSString *type;

@end

@implementation RIBDependency

@end


@interface RIBDependencyGraph ()

@property (nonatomic, readonly) NSMutableDictionary<NSString *, RIBDependencyNode *> *dependencyGraph;
@property (nonatomic, readonly) NSMutableDictionary<NSString *, NSMutableDictionary<NSString *, RIBDependency *> *> *mutableDependencies;

@end

@implementation RIBDependencyGraph

- (NSDictionary<NSString *, RIBDependencyNode *> *)graph
{
    return self.dependencyGraph.copy;
}

- (NSDictionary<NSString *, NSDictionary<NSString *, RIBDependency *> *> *)dependencies
{
    return self.mutableDependencies.copy;
}

- (instancetype)init
{
    if (self = [super init]) {
        _dependencyGraph = [NSMutableDictionary dictionary];
        _mutableDependencies = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)klass:(Class)klass registerParent:(nonnull NSString *)parent
{
    RIBDependencyNode *node = self.dependencyGraph[NSStringFromClass(klass)] ?: [[RIBDependencyNode alloc] init];
    
    node.klass = klass;
    node.parent = parent;
    
    self.dependencyGraph[NSStringFromClass(klass)] = node;
}

- (void)klass:(Class)klass registerChildren:(nonnull NSArray<NSString *> *)children
{
    RIBDependencyNode *node = self.dependencyGraph[NSStringFromClass(klass)] ?: [[RIBDependencyNode alloc] init];
    
    node.klass = klass;
    [node.mutableChildren addObjectsFromArray:children];
    
    self.dependencyGraph[NSStringFromClass(klass)] = node;
}

- (void)klass:(Class)klass registerDependency:(NSString *)dependency
{
    NSMutableDictionary<NSString *, RIBDependency *> *lookup = self.mutableDependencies[NSStringFromClass(klass)] ?: [NSMutableDictionary dictionary];
    RIBDependency *node = [[RIBDependency alloc] init];
    
    node.klass = klass;
    node.property = dependency;
    node.type = rib_propertyCopyType(klass, dependency);
    
    assert([node.type hasPrefix:@"@"]);
    
    lookup[dependency] = node;
    self.mutableDependencies[NSStringFromClass(klass)] = lookup;
}

- (BOOL)containsDependency:(NSString *)dependency type:(NSString *)type
{
    __block BOOL result = NO;
    [self.dependencies enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSDictionary<NSString *,RIBDependency *> * _Nonnull obj, BOOL * _Nonnull stop) {
        [obj enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, RIBDependency * _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj.property isEqualToString:dependency] && [obj.type isEqualToString:type]) {
                result = YES;
            }
        }];
    }];
    
    return result;
}

@end
