//
//  NameSettingRouter.m
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "NameSettingRouter.h"

@interface NameSettingRouter ()

@end

@implementation NameSettingRouter

- (instancetype)initWithInteractor:(NameSettingInteractor *)interactor environment:(nonnull id<SettingsEnvironment>)environment
{
    if (self = [super initWithInteractor:interactor]) {
        _environment = environment;
        self.environment.childViewController = self.interactor.presenter.viewController;
    }
    return self;
}

@end
