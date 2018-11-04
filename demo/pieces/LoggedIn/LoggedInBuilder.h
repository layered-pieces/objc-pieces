//
//  LoggedInBuilder.h
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LoggedInRouter.h"
#import "LoggedInInteractor.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface LoggedInBuilder : NSObject <RIBBuilder>

+ (LoggedInRouter *)buildWithLogoutAction:(dispatch_block_t)logoutAction;

@end

NS_ASSUME_NONNULL_END
