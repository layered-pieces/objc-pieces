//
//  SettingsBuilder.h
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SettingsRouter.h"
#import "SettingsInteractor.h"
#import "SettingsPresenter.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface SettingsBuilder : NSObject <RIBBuilder>

+ (SettingsRouter *)buildWithDelegate:(id<SettingsInteractorDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
