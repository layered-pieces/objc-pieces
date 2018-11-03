//
//  RIBPresentablePresenter.m
//  pieces
//
//  Created by Oliver Letterer on 03.11.18.
//

#import "RIBPresentablePresenter.h"
#import "di/RIBDependencyInjection.h"

#import <objc/runtime.h>

@implementation RIBPresentablePresenter

+ (void)initialize
{
    if (self != RIBPresentablePresenter.class) {
        return;
    }
    
    [RIBDependencyInjection addDependencyPath:UIViewController.class properties:@[ NSStringFromSelector(@selector(presenter)) ]];
}

- (instancetype)initWithViewController:(UIViewController *)viewController
{
    if (self = [super init]) {
        _viewController = viewController;
        _viewController.presenter = self;
    }
    return self;
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

