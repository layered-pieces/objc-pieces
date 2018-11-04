//
//  LoggedInRouter.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "LoggedInRouter.h"

#import "GameOverviewBuilder.h"
#import "CompletionActionBuilder.h"

@interface LoggedInRouter ()

@property (nonatomic, readonly) GameOverviewRouter *gameOverview;
@property (nonatomic, readonly) CompletionActionRouter *completionAction;

@end

@implementation LoggedInRouter

+ (void)initialize
{
    [self registerInjectableDependency:NSStringFromSelector(@selector(backgroundColor))];
}

- (instancetype)initWithInteractor:(LoggedInInteractor *)interactor logoutAction:(nonnull dispatch_block_t)logoutAction
{
    if (self = [super initWithInteractor:interactor]) {
        _gameOverview = [GameOverviewBuilder buildWithLogoutAction:logoutAction];
        [self attachChild:self.gameOverview];
        
        self.interactor.navigationController.viewControllers = @[ self.gameOverview.interactor.viewController ];
        self.backgroundColor = [[NSUserDefaults standardUserDefaults] stringForKey:@"settings.color"];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_userDefaultsDidChange) name:NSUserDefaultsDidChangeNotification object:nil];
    }
    return self;
}

- (void)_userDefaultsDidChange
{
    self.backgroundColor = [[NSUserDefaults standardUserDefaults] stringForKey:@"settings.color"];
}

@end
