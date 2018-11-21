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

    [self _debugStreams:NO];
    [self _debugRouterHierarchy:NO];
    
    return YES;
}

- (void)_debugStreams:(BOOL)enabled
{
    if (!enabled) {
        return;
    }
    
    self.streamObserver = [[StreamOwner alloc] init];
    RIBStream<NSNumber *> *stream1 = [[RIBStream alloc] initWithInitialValue:@5];
    RIBStream<NSNumber *> *stream2 = [[RIBStream alloc] initWithInitialValue:@10];
    
    NSLog(@"stream1 = %@", stream1);
    NSLog(@"stream2 = %@", stream2);
    
    [[stream1 subscribeNext:^(NSNumber * _Nullable next) {
        NSLog(@"stream1 has now value %@", next);
    }] addToBag:self.streamObserver.disposableBag];
    
    [[stream2 subscribeNext:^(NSNumber * _Nullable next) {
        NSLog(@"stream2 has now value %@", next);
    }] addToBag:self.streamObserver.disposableBag];
    
    RIBStream<NSNumber *> *stream3 = [RIBStream reduce:stream1 stream:stream2 block:^id _Nullable(NSNumber * _Nullable object1, NSNumber * _Nullable object2) {
        return @(object1.integerValue + object2.integerValue);
    }];
    
    NSLog(@"stream3 = %@", stream3);
    
    [[stream3 subscribeNext:^(NSNumber * _Nullable next) {
        NSLog(@"stream3 has now value %@", next);
    }] addToBag:self.streamObserver.disposableBag];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [stream1 postNextValue:@10];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [stream2 postNextValue:@20];
    });
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
        NSLog(@"Deallocation stream owner after 5s");
        self.streamObserver = nil;
    }];
    
    [NSTimer scheduledTimerWithTimeInterval:6.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
        NSLog(@"Posting new value to stream1, which should not trigger any observers");
        [stream1 postNextValue:@10];
    }];
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
