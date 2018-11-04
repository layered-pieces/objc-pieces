//
//  RIBInteractor.m
//  Pods-abstract-demo
//
//  Created by Oliver Letterer on 02.11.18.
//

#import "RIBInteractor.h"
#import "RIBRouter.h"

#import "di/runtime.h"
#import "di/RIBDependencyGraph.h"

@interface RIBInteractor ()

@property (nonatomic, assign) BOOL isActive;

- (void)_internalActivate;
- (void)_internalDeactivate;

@end

@implementation RIBInteractor

- (instancetype)init
{
    return [super init];
}

#pragma mark - RIBDependencyContainer

+ (RIBDependencyGraph *)dependencyGraph
{
    return RIBRouter.dependencyGraph;
}

+ (void)registerInjectableDependency:(NSString *)dependency
{
    assert([self dependencyGraph] != nil);
    
    rib_implementDependencyObserver(self, dependency);
    [[self dependencyGraph] klass:self registerDependency:dependency];
}

- (void)rib_injectedDependencyDidChange:(NSString *)dependency
{
    
}

#pragma mark - private category implementation ()

- (void)_internalActivate
{
    [self willActivate];
    self.isActive = YES;
    [self didActivate];
}

- (void)_internalDeactivate
{
    [self willDeactivate];
    self.isActive = NO;
    [self didDeactivate];
}

@end

@implementation RIBInteractor (Callbacks)

- (void)willActivate
{
    
}

- (void)didActivate
{
    
}

- (void)willDeactivate
{
    
}

- (void)didDeactivate
{
    
}

@end
