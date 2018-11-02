//
//  LoggedOutBuilder.h
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LoggedOutRouter.h"
#import "LoggedOutInteractor.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

@interface LoggedOutBuilder : NSObject

+ (LoggedOutRouter *)buildWithDelegate:(id<LoggedOutInteractorDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
