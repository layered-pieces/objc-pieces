//
//  LoggedOutBuilder.m
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import "LoggedOutBuilder.h"

@interface LoggedOutBuilder ()

@end

@implementation LoggedOutBuilder

+ (LoggedOutRouter *)buildWithDelegate:(id<LoggedOutInteractorDelegate>)delegate
{
    LoggedOutInteractor *interactor = [[LoggedOutInteractor alloc] initWithDelegate:delegate];
    LoggedOutRouter *router = [[LoggedOutRouter alloc] initWithInteractor:interactor];
    
    return router;
}

@end
