//
//  LoggedOutViewController.h
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoggedOutViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol LoggedOutViewControllerDelegate <NSObject>

- (void)loggedOutViewController:(LoggedOutViewController *)viewController didLoginWithName:(NSString *)name;

@end

@interface LoggedOutViewController : UIViewController

@property (nonatomic, weak) id<LoggedOutViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
