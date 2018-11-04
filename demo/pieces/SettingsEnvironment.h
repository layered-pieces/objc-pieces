//
//  SettingsEnvironment.h
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SettingsEnvironment<NSObject>

@property (nonatomic, nullable) UIViewController *childViewController;

@end

NS_ASSUME_NONNULL_END
