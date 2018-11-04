//
//  GameOverviewBuilder.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "GameOverviewBuilder.h"

@interface GameOverviewBuilder ()

@end

@implementation GameOverviewBuilder

+ (GameOverviewRouter *)buildWithLogoutAction:(dispatch_block_t)logoutAction
{
    GameOverviewInteractor *interactor = [[GameOverviewInteractor alloc] init];
    GameOverviewRouter *router = [[GameOverviewRouter alloc] initWithInteractor:interactor logoutAction:logoutAction];

    return router;
}

@end
