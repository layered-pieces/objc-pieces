//
//  SettingsActionBuilder.h
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SettingsActionRouter.h"
#import "SettingsActionInteractor.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface SettingsActionBuilder : NSObject <RIBBuilder>

+ (SettingsActionRouter *)buildWithBlock:(dispatch_block_t)block;

@end

NS_ASSUME_NONNULL_END
