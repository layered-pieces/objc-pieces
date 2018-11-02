//
//  RIBRouter.m
//  Pods-abstract-demo
//
//  Created by Oliver Letterer on 02.11.18.
//

#import "RIBRouter.h"
#import "RIBInteractor.h"
#import "di/RIBDependencyInjection.h"

#import <objc/runtime.h>

@interface RIBRouter ()

@property (nonatomic, assign) BOOL isLoaded;
@property (nonatomic, weak) UIWindow *attachedWindow;

@property (nonatomic, strong) NSArray<RIBRouter *> *children;
@property (nonatomic, readonly) NSMutableArray<RIBRouter *> *mutableChildren;

@property (nonatomic, weak) RIBRouter *parent;

@end

@interface RIBInteractor ()

- (void)_internalActivate;
- (void)_internalDeactivate;

@end

@implementation RIBRouter

+ (void)initialize
{
    [RIBDependencyInjection addDependencyPath:RIBRouter.class properties:@[ NSStringFromSelector(@selector(parent)), NSStringFromSelector(@selector(attachedWindow)) ]];
}

+ (void)load
{
    assert([RIBInteractor instanceMethodForSelector:@selector(_internalActivate)] != NULL);
    assert([RIBInteractor instanceMethodForSelector:@selector(_internalDeactivate)] != NULL);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if ([self resolveInjectedProperty:sel]) {
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

- (NSMutableArray<RIBRouter *> *)mutableChildren
{
    return [self mutableArrayValueForKey:NSStringFromSelector(@selector(children))];
}

- (instancetype)initWithInteractor:(RIBInteractor *)interactor
{
    assert(interactor.router == nil);

    if (self = [super init]) {
        _children = @[];
        _interactor = interactor;
        interactor.router = self;
    }
    return self;
}

- (void)attachChild:(RIBRouter *)childRouter
{
    assert(![self.children containsObject:childRouter]);
    assert(childRouter.parent == nil);
    
    [childRouter willAttachToParent:self];
    childRouter.parent = self;
    [self.mutableChildren addObject:childRouter];
    
    [self _enumerateSubtree:childRouter reverse:YES block:^(RIBRouter *router) {
        [router.interactor _internalActivate];
    }];
    
    [childRouter didAttachToParent:self];
    
    if ([self _isGloballyAttached]) {
        [self _enumerateSubtree:childRouter reverse:NO block:^(RIBRouter *router) {
            [router _internalLoad];
        }];
    }
}

- (void)detachChild:(RIBRouter *)childRouter
{
    assert([self.children containsObject:childRouter]);
    
    [childRouter willDetachFromParent:self];
    
    [self _enumerateSubtree:childRouter reverse:YES block:^(RIBRouter *router) {
        [router.interactor _internalDeactivate];
    }];
    
    childRouter.parent = nil;
    [childRouter didDetachFromParent:self];
}

- (void)_internalLoad
{
    if (self.isLoaded) {
        return;
    }
    
    self.isLoaded = YES;
    [self didLoad];
}

- (BOOL)_isGloballyAttached
{
    RIBRouter *parent = self;
    while (self.parent != nil) {
        parent = self.parent;
    }
    
    return parent.attachedWindow != nil;
}

- (void)_enumerateSubtree:(RIBRouter *)router reverse:(BOOL)reverse block:(void(^)(RIBRouter *router))block
{
    if (!reverse) {
        block(router);
    }
    
    for (RIBRouter *child in router.children) {
        [self _enumerateSubtree:child reverse:reverse block:block];
    }
    
    if (reverse) {
        block(router);
    }
}

@end

@implementation RIBRouter (Callbacks)

- (void)didLoad
{
    
}

- (void)willAttachToParent:(RIBRouter *)parentRouter
{
    
}

- (void)didAttachToParent:(RIBRouter *)parentRouter
{
    
}

- (void)willDetachFromParent:(RIBRouter *)parentRouter
{
    
}

- (void)didDetachFromParent:(RIBRouter *)parentRouter
{
    
}

@end

@implementation UIWindow (RIBRootRouter)

- (void)setRootRouter:(RIBRouter *)rootRouter
{
    RIBRouter *oldRouter = self.rootRouter;
    [oldRouter _enumerateSubtree:oldRouter reverse:YES block:^(RIBRouter *router) {
        [router.interactor _internalDeactivate];
    }];
    
    oldRouter.attachedWindow = nil;
    objc_setAssociatedObject(self, @selector(rootRouter), rootRouter, OBJC_ASSOCIATION_ASSIGN);
    rootRouter.attachedWindow = self;
    
    [rootRouter _enumerateSubtree:rootRouter reverse:YES block:^(RIBRouter *router) {
        [router.interactor _internalActivate];
    }];
    
    [rootRouter _internalLoad];
}

- (RIBRouter *)rootRouter
{
    return objc_getAssociatedObject(self, @selector(rootRouter));
}

@end
