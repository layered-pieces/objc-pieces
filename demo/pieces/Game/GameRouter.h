//
//  GameRouter.h
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GameInteractor.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface GameRouter : RIBRouter<GameInteractor *>

- (void)routeToCompletionWithResult:(BOOL)success;

@property (nonatomic, readonly) dispatch_block_t completion;
@property (nonatomic, readonly) id<RIBApplicationEnvironment> applicationEnvironment;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithInteractor:(GameInteractor *)interactor NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithInteractor:(GameInteractor *)interactor completion:(dispatch_block_t)completion NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
