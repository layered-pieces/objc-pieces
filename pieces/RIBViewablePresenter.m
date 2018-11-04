//
//  RIBViewablePresenter.m
//  pieces
//
//  Created by Oliver Letterer on 03.11.18.
//

#import "RIBViewablePresenter.h"
#import "RIBRouter.h"

#import "di/runtime.h"
#import "di/RIBDependencyGraph.h"

#import <objc/runtime.h>

@implementation RIBViewablePresenter

- (instancetype)initWithView:(UIView *)view
{
    if (self = [super init]) {
        _view = view;
        _view.presenter = self;
    }
    return self;
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

- (void)dealloc
{
    self.view.presenter = nil;
}

@end


@implementation UIView (RIBViewablePresenter)

- (RIBViewablePresenter *)presenter
{
    return objc_getAssociatedObject(self, @selector(presenter));
}

- (void)setPresenter:(RIBViewablePresenter *)presenter
{
    objc_setAssociatedObject(self, @selector(presenter), presenter, OBJC_ASSOCIATION_ASSIGN);
}

@end
