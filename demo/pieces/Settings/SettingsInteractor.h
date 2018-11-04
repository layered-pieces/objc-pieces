//
//  SettingsInteractor.h
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SettingsPresenter.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

@class SettingsInteractor, SettingsRouter;

@protocol SettingsInteractorDelegate <NSObject>

- (void)settingsInteractorIsDone:(SettingsInteractor *)interactor;

@end

__attribute__((objc_subclassing_restricted))
@interface SettingsInteractor : RIBPresentingInteractor<SettingsRouter *, SettingsPresenter *>

@property (nonatomic, weak, readonly) id<SettingsInteractorDelegate> delegate;

@property (nonatomic, readonly) dispatch_block_t complectionAction;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithPresenter:(SettingsPresenter *)presenter NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;

- (instancetype)initWithPresenter:(SettingsPresenter *)presenter delegate:(id<SettingsInteractorDelegate>)delegate NS_DESIGNATED_INITIALIZER;

@end

@interface SettingsInteractor (SettingsPresenterDelegate) <SettingsPresenterDelegate>

@end

NS_ASSUME_NONNULL_END
