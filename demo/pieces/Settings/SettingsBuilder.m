//
//  SettingsBuilder.m
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "SettingsBuilder.h"

@interface SettingsBuilder ()

@end

@implementation SettingsBuilder

+ (SettingsRouter *)buildWithDelegate:(id<SettingsInteractorDelegate>)delegate
{
    SettingsPresenter *presenter = [[SettingsPresenter alloc] init];
    SettingsInteractor *interactor = [[SettingsInteractor alloc] initWithPresenter:presenter delegate:delegate];
    SettingsRouter *router = [[SettingsRouter alloc] initWithInteractor:interactor];

    return router;
}

@end
