//
//  LoggedInBuilder.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "LoggedInBuilder.h"

@interface LoggedInBuilder ()

@end

@implementation LoggedInBuilder

+ (LoggedInRouter *)buildWithLogoutAction:(dispatch_block_t)logoutAction
{
    LoggedInInteractor *interactor = [[LoggedInInteractor alloc] init];
    LoggedInRouter *router = [[LoggedInRouter alloc] initWithInteractor:interactor logoutAction:logoutAction];

    return router;
}

@end
