//
//  RIBPresentablePresenter.m
//  pieces
//
//  Created by Oliver Letterer on 03.11.18.
//

#import "RIBPresentablePresenter.h"
#import "RIBRouter.h"

#import "di/runtime.h"
#import "di/RIBDependencyGraph.h"

#import <objc/runtime.h>

@implementation RIBPresentablePresenter

- (instancetype)initWithViewController:(UIViewController *)viewController
{
    if (self = [super init]) {
        _viewController = viewController;
        _viewController.presenter = self;
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

@end

@implementation UIViewController (RIBViewablePresenter)

- (RIBPresentablePresenter *)presenter
{
    return objc_getAssociatedObject(self, @selector(presenter));
}

- (void)setPresenter:(RIBPresentablePresenter *)presenter
{
    objc_setAssociatedObject(self, @selector(presenter), presenter, OBJC_ASSOCIATION_ASSIGN);
}

@end

