//
//  RootInteractor.h
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LoggedOutInteractor.h"

@import pieces;
@class RootRouter;

NS_ASSUME_NONNULL_BEGIN

@interface RootInteractor : RIBInteractor<RootRouter *>

@property (nonatomic, readonly) dispatch_block_t logoutAction;

- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end

@interface RootInteractor (LoggedOutInteractorDelegate) <LoggedOutInteractorDelegate>

@end

NS_ASSUME_NONNULL_END
