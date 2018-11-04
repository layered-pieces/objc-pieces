//
//  SettingsPresenter.h
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SettingsViewController.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

@class SettingsPresenter, SettingsInteractor;

@protocol SettingsPresenterDelegate <NSObject>

@end

__attribute__((objc_subclassing_restricted))
@interface SettingsPresenter : RIBPresentablePresenter<SettingsInteractor *, SettingsViewController *>

@property (nonatomic, weak) id<SettingsPresenterDelegate> delegate;

- (instancetype)init NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithViewController:(SettingsViewController *)viewController NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;

@end


@interface SettingsPresenter (SettingsViewControllerDelegate) <SettingsViewControllerDelegate>

@end

NS_ASSUME_NONNULL_END
