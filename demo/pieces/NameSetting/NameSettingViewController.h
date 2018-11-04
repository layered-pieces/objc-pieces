//
//  NameSettingViewController.h
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class NameSettingViewController;

@protocol NameSettingViewControllerDelegate <NSObject>

- (void)nameSettingViewController:(NameSettingViewController *)viewController didChangeName:(NSString *)name;

@end

__attribute__((objc_subclassing_restricted))
@interface NameSettingViewController : UIViewController

@property (nonatomic, weak) id<NameSettingViewControllerDelegate> delegate;

@property (nonatomic, nullable) NSString *name;

- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
