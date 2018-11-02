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

@interface AppDelegate ()

@property (nonatomic, readonly) RootRouter *router;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyWindow];
    
    _router = [RootBuilder build];
    [_router launch:self.window];
    
    return YES;
}

@end
