//
//  RIBEnvironment.m
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import "RIBEnvironment.h"

@interface _RIBApplicationEnvironment : NSObject <RIBApplicationEnvironment>

- (instancetype)initWithWindow:(UIWindow *)window;

@end

@implementation _RIBApplicationEnvironment
@synthesize window = _window;

- (UIViewController *)topViewController
{
    UIViewController *topViewController = self.window.rootViewController;
    while (topViewController.presentedViewController != nil) {
        topViewController = topViewController.presentedViewController;
    }
    
    return topViewController;
}

- (instancetype)initWithWindow:(UIWindow *)window
{
    assert(window != nil);

    if (self = [super init]) {
        _window = window;
    }
    return self;
}

- (void)dismissViewControllerAnimated:(BOOL)animated
{
    [self dismissViewControllerAnimated:animated completion:nil];
}

- (void)dismissViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self dismissViewController:viewController animated:animated completion:nil];
}

- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self presentViewController:viewController animated:animated completion:nil];
}

- (void)dismissViewControllerAnimated:(BOOL)animated completion:(dispatch_block_t)completion
{
    [self.topViewController dismissViewControllerAnimated:animated completion:completion];
}

- (void)dismissViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(nullable dispatch_block_t)completion
{
    UIViewController *subtree = self.window.rootViewController;
    
    while (![self _subtree:subtree containsViewController:viewController] && subtree != nil) {
        subtree = subtree.presentedViewController;
    }
    
    if (subtree == nil) {
        return;
    }
    
    [subtree.presentingViewController dismissViewControllerAnimated:animated completion:completion];
}

- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^ _Nullable)(void))completion
{
    [self.topViewController presentViewController:viewController animated:animated completion:completion];
}

- (BOOL)_subtree:(UIViewController *)subtree containsViewController:(UIViewController *)viewController
{
    if (viewController == subtree) {
        return YES;
    }
    
    for (UIViewController *child in subtree.childViewControllers) {
        if ([self _subtree:child containsViewController:viewController]) {
            return YES;
        }
    }
    
    return NO;
}

@end

@implementation UIApplication (RIBApplicationEnvironment)

- (id<RIBApplicationEnvironment>)applicationEnvironment
{
    return [[_RIBApplicationEnvironment alloc] initWithWindow:self.keyWindow];
}

@end
