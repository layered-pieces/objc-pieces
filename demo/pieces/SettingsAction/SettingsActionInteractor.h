//
//  SettingsActionInteractor.h
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

@import pieces;

NS_ASSUME_NONNULL_BEGIN

@class SettingsActionRouter;

__attribute__((objc_subclassing_restricted))
@interface SettingsActionInteractor : RIBInteractor<SettingsActionRouter *>

@property (nonatomic, readonly) dispatch_block_t block;
@property (nonatomic, readonly) UIBarButtonItem *barButtonItem;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithBlock:(dispatch_block_t)block NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
