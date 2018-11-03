//
//  RIBViewableInteractor.m
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import "RIBViewableInteractor.h"
#import "di/RIBDependencyInjection.h"

#import <objc/runtime.h>

@implementation RIBViewableInteractor

+ (void)initialize
{
    if (self != RIBViewableInteractor.class) {
        return;
    }
    
    [RIBDependencyInjection addDependencyPath:UIView.class properties:@[ NSStringFromSelector(@selector(interactor)) ]];
}

- (instancetype)initWithView:(UIView *)view
{
    if (self = [super init]) {
        _view = view;
        _view.interactor = self;
    }
    return self;
}

- (void)dealloc
{
    self.view.interactor = nil;
}

@end


@implementation UIView (RIBViewableInteractor)

- (RIBViewableInteractor *)interactor
{
    return objc_getAssociatedObject(self, @selector(interactor));
}

- (void)setInteractor:(RIBViewableInteractor *)interactor
{
    objc_setAssociatedObject(self, @selector(interactor), interactor, OBJC_ASSOCIATION_ASSIGN);
}

@end
