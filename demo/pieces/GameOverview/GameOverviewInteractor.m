//
//  GameOverviewInteractor.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "GameOverviewInteractor.h"
#import "GameOverviewRouter.h"

@interface GameOverviewInteractor ()

@end

@implementation GameOverviewInteractor

- (instancetype)init
{
    GameOverviewViewController *viewController = [[GameOverviewViewController alloc] init];
    viewController.delegate = self;

    if (self = [super initWithViewController:viewController]) {
        __weak typeof(self) welf = self;
        _settingsAction = ^{
            [welf.router routeToSettings];
        };
    }
    return self;
}

@end

@implementation GameOverviewInteractor (GameOverviewViewControllerDelegate)

@end
