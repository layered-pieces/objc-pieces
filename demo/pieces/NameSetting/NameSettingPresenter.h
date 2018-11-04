//
//  NameSettingPresenter.h
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NameSettingViewController.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

@class NameSettingPresenter, NameSettingInteractor;

@protocol NameSettingPresenterDelegate <NSObject>

@end

__attribute__((objc_subclassing_restricted))
@interface NameSettingPresenter : RIBPresentablePresenter<NameSettingInteractor *, NameSettingViewController *>

@property (nonatomic, weak) id<NameSettingPresenterDelegate> delegate;

- (instancetype)init NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithViewController:(NameSettingViewController *)viewController NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;

@end


@interface NameSettingPresenter (NameSettingViewControllerDelegate) <NameSettingViewControllerDelegate>

@end

NS_ASSUME_NONNULL_END
