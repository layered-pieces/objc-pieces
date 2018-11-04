//
//  NameSettingInteractor.h
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NameSettingPresenter.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

@class NameSettingRouter;

__attribute__((objc_subclassing_restricted))
@interface NameSettingInteractor : RIBPresentingInteractor<NameSettingRouter *, NameSettingPresenter *>

@end

@interface NameSettingInteractor (NameSettingPresenterDelegate) <NameSettingPresenterDelegate>

@end

NS_ASSUME_NONNULL_END
