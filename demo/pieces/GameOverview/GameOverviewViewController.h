//
//  GameOverviewViewController.h
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GameOverviewViewController;

@protocol GameOverviewViewControllerDelegate <NSObject>

- (void)gameOverviewViewControllerPlayButtonTapped:(GameOverviewViewController *)viewController;

@end

__attribute__((objc_subclassing_restricted))
@interface GameOverviewViewController : UIViewController

@property (nonatomic, weak) id<GameOverviewViewControllerDelegate> delegate;

- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
