//
//  RIBInteractor.m
//  Pods-abstract-demo
//
//  Created by Oliver Letterer on 02.11.18.
//

#import "RIBInteractor.h"
#import "di/RIBDependencyInjection.h"

@interface RIBInteractor ()

@property (nonatomic, assign) BOOL isActive;

- (void)_internalActivate;
- (void)_internalDeactivate;

@end

@implementation RIBInteractor

+ (void)initialize
{
    [RIBDependencyInjection addDependencyPath:RIBInteractor.class properties:@[ NSStringFromSelector(@selector(router)) ]];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if ([self resolveInjectedProperty:sel]) {
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

- (instancetype)init
{
    return [super init];
}

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
