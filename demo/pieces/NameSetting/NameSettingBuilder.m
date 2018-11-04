//
//  NameSettingBuilder.m
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "NameSettingBuilder.h"

@interface NameSettingBuilder ()

@end

@implementation NameSettingBuilder

+ (NameSettingRouter *)buildWithEnvironment:(id<SettingsEnvironment>)environment
{
    NameSettingPresenter *presenter = [[NameSettingPresenter alloc] init];
    NameSettingInteractor *interactor = [[NameSettingInteractor alloc] initWithPresenter:presenter];
    NameSettingRouter *router = [[NameSettingRouter alloc] initWithInteractor:interactor environment:environment];

    return router;
}

@end
