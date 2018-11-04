//
//  GameOverviewInteractor.h
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GameOverviewViewController.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

@class GameOverviewRouter;

__attribute__((objc_subclassing_restricted))
@interface GameOverviewInteractor : RIBPresentableInteractor<GameOverviewRouter *, GameOverviewViewController *>

- (instancetype)init NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithViewController:(GameOverviewViewController *)viewController NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;

@end

@interface GameOverviewInteractor (GameOverviewViewControllerDelegate) <GameOverviewViewControllerDelegate>

@end

NS_ASSUME_NONNULL_END
