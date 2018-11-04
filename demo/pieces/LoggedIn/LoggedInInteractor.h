//
//  LoggedInInteractor.h
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NavigationEnvironment.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

@class LoggedInRouter;

__attribute__((objc_subclassing_restricted))
@interface LoggedInInteractor : RIBInteractor<LoggedInRouter *> <NavigationEnvironment>

- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
