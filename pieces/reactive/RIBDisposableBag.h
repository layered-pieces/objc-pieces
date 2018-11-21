//
//  RIBDisposableBag.h
//  pieces
//
//  Created by Oliver Letterer on 21.11.18.
//

#import <Foundation/Foundation.h>

@protocol RIBDisposable;

NS_ASSUME_NONNULL_BEGIN

@interface RIBDisposableBag : NSObject

@property (nonatomic, readonly) NSArray<id<RIBDisposable>> *disposables;
@property (nonatomic, weak, nullable, readonly) id owner;

- (void)addDisposable:(id<RIBDisposable>)disposable;

- (instancetype)init NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithOwner:(id)owner NS_DESIGNATED_INITIALIZER;

@end

@interface NSObject (RIBDisposableBag)

@property (nonatomic, readonly) RIBDisposableBag *disposableBag;

@end

NS_ASSUME_NONNULL_END
