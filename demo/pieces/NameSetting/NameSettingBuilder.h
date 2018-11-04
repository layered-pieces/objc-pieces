//
//  NameSettingBuilder.h
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NameSettingRouter.h"
#import "NameSettingInteractor.h"
#import "NameSettingPresenter.h"

#import "SettingsEnvironment.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface NameSettingBuilder : NSObject <RIBBuilder>

+ (NameSettingRouter *)buildWithEnvironment:(id<SettingsEnvironment>)environment;

@end

NS_ASSUME_NONNULL_END
