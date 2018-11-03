//
//  LoggedOutViewController.h
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LoggedOutViewController;

@protocol LoggedOutViewControllerDelegate <NSObject>

- (void)loggedOutViewController:(LoggedOutViewController *)viewController didLoginWithName:(NSString *)name;

@end

@interface LoggedOutViewController : UIViewController

@property (nonatomic, weak) id<LoggedOutViewControllerDelegate> delegate;

- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
