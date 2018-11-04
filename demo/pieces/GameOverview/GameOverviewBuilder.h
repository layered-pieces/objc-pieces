//
//  GameOverviewBuilder.h
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GameOverviewRouter.h"
#import "GameOverviewInteractor.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface GameOverviewBuilder : NSObject <RIBBuilder>

+ (GameOverviewRouter *)buildWithLogoutAction:(dispatch_block_t)logoutAction;

@end

NS_ASSUME_NONNULL_END
