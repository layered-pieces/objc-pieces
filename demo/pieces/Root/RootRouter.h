//
//  RootRouter.h
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootInteractor.h"

@import pieces;
@class RootInteractor;

NS_ASSUME_NONNULL_BEGIN

@interface RootRouter : RIBRouter<RootInteractor *> <RIBRootRouter>

@property (nonatomic, readonly) id<RIBApplicationEnvironment> applicationEnvironment;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithInteractor:(RootInteractor *)interactor NS_DESIGNATED_INITIALIZER;

- (void)routeToLoggedOut;
- (void)routeToLoggedInWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
