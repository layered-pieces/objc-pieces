//
//  RIBViewablePresenter.m
//  pieces
//
//  Created by Oliver Letterer on 03.11.18.
//

#import "RIBViewablePresenter.h"
#import "di/RIBDependencyInjection.h"

#import <objc/runtime.h>

@implementation RIBViewablePresenter

+ (void)initialize
{
    if (self != RIBViewablePresenter.class) {
        return;
    }
    
    [RIBDependencyInjection addDependencyPath:UIView.class properties:@[ NSStringFromSelector(@selector(presenter)) ]];
}

- (instancetype)initWithView:(UIView *)view
{
    if (self = [super init]) {
        _view = view;
        _view.presenter = self;
    }
    return self;
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
