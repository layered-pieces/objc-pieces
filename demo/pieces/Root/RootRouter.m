//
//  RootRouter.m
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import "RootRouter.h"
#import "RootInteractor.h"

#import "LoggedInBuilder.h"
#import "LoggedOutBuilder.h"

@interface RootRouter ()

@property (nonatomic, nullable) LoggedOutRouter *loggedOut;
@property (nonatomic, nullable) LoggedInRouter *loggedIn;

@end

@implementation RootRouter

+ (void)initialize
{
    [self registerInjectableDependency:NSStringFromSelector(@selector(applicationEnvironment))];
}

- (void)launch:(UIWindow *)window
{
    window.rootViewController = [[UIViewController alloc] init];
    window.rootViewController.view.backgroundColor = [UIColor orangeColor];
    [window makeKeyAndVisible];
    
    window.rootRouter = self;
}

- (instancetype)initWithInteractor:(RootInteractor *)interactor environment:(nonnull id<RIBApplicationEnvironment>)applicationEnvironment
{
    if (self = [super initWithInteractor:interactor]) {
        _applicationEnvironment = applicationEnvironment;
    }
    return self;
}

- (void)routeToLoggedOut
{
    assert(self.loggedOut == nil);
    
    self.applicationEnvironment.window.rootViewController = [[UIViewController alloc] init];
    self.applicationEnvironment.window.rootViewController.view.backgroundColor = [UIColor blueColor];
    
    self.loggedOut = [LoggedOutBuilder buildWithDelegate:self.interactor];
    [self attachChild:self.loggedOut];
}

- (void)routeToLoggedInWithName:(NSString *)name
{
    [self.applicationEnvironment dismissViewControllerAnimated:YES completion:^{
        [self detachChild:self.loggedOut];
        self.loggedOut = nil;
        
        self.loggedIn = [LoggedInBuilder build];
        [self attachChild:self.loggedIn];
        
        self.applicationEnvironment.window.rootViewController = self.loggedIn.interactor.navigationController;
    }];
}

@end
