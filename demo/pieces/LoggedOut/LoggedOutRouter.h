//
//  LoggedOutRouter.h
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LoggedOutInteractor.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

@interface LoggedOutRouter : RIBRouter<LoggedOutInteractor *>

@property (nonatomic, readonly) id<RIBApplicationEnvironment> applicationEnvironment;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithInteractor:(LoggedOutInteractor *)interactor NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
