//
//  SettingsActionBuilder.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "SettingsActionBuilder.h"

@interface SettingsActionBuilder ()

@end

@implementation SettingsActionBuilder

+ (SettingsActionRouter *)build
{
    SettingsActionInteractor *interactor = [[SettingsActionInteractor alloc] init];
    SettingsActionRouter *router = [[SettingsActionRouter alloc] initWithInteractor:interactor];

    return router;
}

@end
