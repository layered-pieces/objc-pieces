//
//  RootBuilder.h
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import <Foundation/Foundation.h>

@import pieces;
@class RootRouter;

NS_ASSUME_NONNULL_BEGIN

@interface RootBuilder : NSObject <RIBBuilder>

+ (RootRouter *)buildWithEnvironment:(id<RIBApplicationEnvironment>)applicationEnvironment;

@end

NS_ASSUME_NONNULL_END
