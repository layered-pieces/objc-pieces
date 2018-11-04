//
//  SettingsRouter.h
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SettingsInteractor.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface SettingsRouter : RIBRouter<SettingsInteractor *>

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithInteractor:(SettingsInteractor *)interactor NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
