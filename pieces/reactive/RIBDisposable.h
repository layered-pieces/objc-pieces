//
//  RIBDisposable.h
//  pieces
//
//  Created by Oliver Letterer on 21.11.18.
//

#import <Foundation/Foundation.h>

@class RIBDisposableBag;

NS_ASSUME_NONNULL_BEGIN

@protocol RIBDisposable <NSCopying, NSObject>

- (void)dispose;
- (void)addToBag:(RIBDisposableBag *)bag;

@end

@interface RIBDisposable : NSObject

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;

+ (id<RIBDisposable>)disposableWithBlock:(void(^)(id<RIBDisposable> disposable))block;

@end

NS_ASSUME_NONNULL_END
