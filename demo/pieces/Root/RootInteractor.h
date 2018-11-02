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

@end

@interface RootInteractor (LoggedOutInteractorDelegate) <LoggedOutInteractorDelegate>

@end

NS_ASSUME_NONNULL_END
