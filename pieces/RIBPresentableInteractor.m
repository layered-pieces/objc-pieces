//
//  RIBPresentableInteractor.m
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import "RIBPresentableInteractor.h"
#import <objc/runtime.h>

@implementation RIBPresentableInteractor

- (instancetype)initWithViewController:(UIViewController *)viewController
{
    if (self = [super init]) {
        _viewController = viewController;
    }
    return self;
}

@end


@implementation UIViewController (RIBPresentableInteractor)

- (RIBPresentableInteractor *)interactor
{
    return objc_getAssociatedObject(self, @selector(interactor));
}

- (void)setInteractor:(RIBPresentableInteractor *)interactor
{
    objc_setAssociatedObject(self, @selector(interactor), interactor, OBJC_ASSOCIATION_RETAIN);
}

@end
