//
//  GameBuilder.h
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GameRouter.h"
#import "GameInteractor.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface GameBuilder : NSObject <RIBBuilder>

+ (GameRouter *)buildWithCompletion:(dispatch_block_t)completion;

@end

NS_ASSUME_NONNULL_END
