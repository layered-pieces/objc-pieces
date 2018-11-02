//
//  LoggedOutRouter.m
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import "LoggedOutRouter.h"

#import "LoggedOutViewController.h"

@implementation LoggedOutRouter
@dynamic applicationEnvironment;

- (void)didLoad
{
    [self.applicationEnvironment presentViewController:self.interactor.viewController animated:NO];
}

@end
