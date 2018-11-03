//
//  LoggedOutRouter.m
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import "LoggedOutRouter.h"

@interface LoggedOutRouter ()

@end

@implementation LoggedOutRouter
@dynamic applicationEnvironment;

- (instancetype)initWithInteractor:(LoggedOutInteractor *)interactor
{
    if (self = [super initWithInteractor:interactor]) {
        
    }
    return self;
}

- (void)didLoad
{
    [self.applicationEnvironment presentViewController:self.interactor.viewController animated:NO];
}

@end
