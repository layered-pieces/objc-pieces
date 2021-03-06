//
//  GameOverviewRouter.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "GameOverviewRouter.h"

#import "GameBuilder.h"
#import "SettingsActionBuilder.h"
#import "CompletionActionBuilder.h"

@interface GameOverviewRouter ()

@property (nonatomic, nullable) GameRouter *game;
@property (nonatomic, readonly) SettingsActionRouter *settingsAction;
@property (nonatomic, readonly) CompletionActionRouter *completionAction;

@end

@implementation GameOverviewRouter

- (instancetype)initWithInteractor:(GameOverviewInteractor *)interactor logoutAction:(nonnull dispatch_block_t)logoutAction
{
    if (self = [super initWithInteractor:interactor]) {
        _settingsAction = [SettingsActionBuilder build];
        _completionAction = [CompletionActionBuilder buildWithBlock:logoutAction];

        [self attachChild:self.settingsAction];
        [self attachChild:self.completionAction];
        
        self.interactor.viewController.navigationItem.leftBarButtonItem = self.settingsAction.interactor.barButtonItem;
        self.interactor.viewController.navigationItem.rightBarButtonItem = self.completionAction.interactor.barButtonItem;
    }
    return self;
}

- (void)routeToGame
{
    self.game = [GameBuilder buildWithCompletion:self.interactor.gameCompletionAction];
    [self attachChild:self.game];
}

- (void)dismissGame
{
    [self detachChild:self.game]; self.game = nil;
}

@end
