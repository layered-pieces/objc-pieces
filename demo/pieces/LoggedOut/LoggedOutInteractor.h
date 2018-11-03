//
//  LoggedOutInteractor.h
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LoggedOutViewController.h"

@import pieces;
@class LoggedOutRouter, LoggedOutInteractor;

NS_ASSUME_NONNULL_BEGIN

@protocol LoggedOutInteractorDelegate <NSObject>

- (void)loggedOutInteractor:(LoggedOutInteractor *)interactor didLoginWithName:(NSString *)name;

@end

@interface LoggedOutInteractor : RIBPresentableInteractor<LoggedOutRouter *, LoggedOutViewController *>

@property (nonatomic, weak, readonly) id<LoggedOutInteractorDelegate> delegate;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithViewController:(LoggedOutViewController *)viewController NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithDelegate:(id<LoggedOutInteractorDelegate>)delegate NS_DESIGNATED_INITIALIZER;

@end

@interface LoggedOutInteractor (LoggedOutViewControllerDelegate) <LoggedOutViewControllerDelegate>

@end

NS_ASSUME_NONNULL_END
