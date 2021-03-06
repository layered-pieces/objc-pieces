//
//  SettingsViewController.h
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsEnvironment.h"

NS_ASSUME_NONNULL_BEGIN

@class SettingsViewController;

@protocol SettingsViewControllerDelegate <NSObject>

- (void)settingsViewController:(SettingsViewController *)viewController didSelectColor:(NSString *)color;

@end

__attribute__((objc_subclassing_restricted))
@interface SettingsViewController : UIViewController <SettingsEnvironment>

@property (nonatomic, weak) id<SettingsViewControllerDelegate> delegate;

@property (nonatomic, strong) NSString *color;
@property (nonatomic, nullable) UIViewController *childViewController;

- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
