//
//  RootInteractor.m
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import "RootInteractor.h"

#import "RootRouter.h"

@implementation RootInteractor

- (void)didActivate
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"name"] == nil) {
        [self.router routeToLoggedOut];
    } else {
        [self.router routeToLoggedInWithName:[[NSUserDefaults standardUserDefaults] objectForKey:@"name"]];
    }
}

@end

@implementation RootInteractor (LoggedOutInteractorDelegate)

- (void)loggedOutInteractor:(LoggedOutInteractor *)interactor didLoginWithName:(NSString *)name
{
    [self.router routeToLoggedInWithName:name];
}

@end
