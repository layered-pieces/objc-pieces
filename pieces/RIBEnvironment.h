//
//  RIBEnvironment.h
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*
 An environment in which the router can route the UI components
 */
@protocol RIBEnvironment <NSObject>

@end

/*
 The default application environment
 */
@protocol RIBApplicationEnvironment <RIBEnvironment>

@property (nonatomic, readonly) UIWindow *window;
@property (nonatomic, readonly) UIViewController *topViewController;

- (void)dismissViewControllerAnimated:(BOOL)animated;
- (void)dismissViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (void)dismissViewControllerAnimated:(BOOL)animated completion:(nullable dispatch_block_t)completion;
- (void)dismissViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(nullable dispatch_block_t)completion;
- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(nullable dispatch_block_t)completion;

@end

@interface UIApplication (RIBApplicationEnvironment)

@property (nonatomic, readonly) id<RIBApplicationEnvironment> applicationEnvironment;

@end

NS_ASSUME_NONNULL_END
