//
//  LoggedOutRouter.h
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

@import pieces;
#import "LoggedOutInteractor.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoggedOutRouter : RIBRouter<LoggedOutInteractor *>

@property (nonatomic, readonly) id<RIBApplicationEnvironment> applicationEnvironment;

@end

NS_ASSUME_NONNULL_END
