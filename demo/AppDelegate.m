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

@interface StreamOwner : NSObject

@end

@implementation StreamOwner

- (void)dealloc
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end

@interface AppDelegate ()

@property (nonatomic, readonly) RootRouter *router;
@property (nonatomic, strong) StreamOwner *streamObserver;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NSBundle.mainBundle resolveDependenciesIncludingFrameworks:YES];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyWindow];
    
    _router = [RootBuilder buildWithEnvironment:application.applicationEnvironment];
    [_router launch:self.window];

    [self _debugRouterHierarchy:YES];
    
    return YES;
}

- (void)_debugRouterHierarchy:(BOOL)enabled
{
    if (!enabled) {
        return;
    }
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"\n%@", self.router.debugDescription);
    }];
}

@end
