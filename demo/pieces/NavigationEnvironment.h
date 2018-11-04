//
//  NavigationEnvironment.h
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NavigationEnvironment <NSObject>

@property (nonatomic, readonly) UINavigationController *navigationController;

@end

@interface UIViewController (NavigationEnvironment) <NavigationEnvironment>
@end

NS_ASSUME_NONNULL_END
