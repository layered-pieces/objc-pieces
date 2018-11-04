//
//  AppDelegate.m
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import "AppDelegate.h"

#import "RootBuilder.h"
#import "RootRouter.h"

#import <objc/runtime.h>

@interface AppDelegate ()

@property (nonatomic, readonly) RootRouter *router;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NSBundle.mainBundle resolveDependenciesIncludingFrameworks:YES];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyWindow];
    
    _router = [RootBuilder buildWithEnvironment:application.applicationEnvironment];
    [_router launch:self.window];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"\n%@", self.router.debugDescription);
    }];
    
    return YES;
}

@end
