//
//  RIBStream.h
//  pieces
//
//  Created by Oliver Letterer on 21.11.18.
//

#import <Foundation/Foundation.h>

@protocol RIBDisposable;

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface RIBStream<Wrapped> : NSObject

@property (nonatomic, nullable, readonly) Wrapped currentValue;

- (void)postNextValue:(nullable Wrapped)nextValue;
- (id<RIBDisposable>)subscribeNext:(void(^)(Wrapped _Nullable next))block __attribute__((warn_unused_result));

- (instancetype)init;
- (instancetype)initWithInitialValue:(nullable id)initialValue NS_DESIGNATED_INITIALIZER;

@end

@interface RIBStream<Wrapped> (Functional)

- (RIBStream *)map:(id(^)(Wrapped _Nullable value))block;

+ (RIBStream *)reduce:(RIBStream *)stream1 stream:(RIBStream *)stream2 block:(id _Nullable(^)(id _Nullable object1, id _Nullable object2))block;
+ (RIBStream *)reduce2:(RIBStream *)stream1 stream:(RIBStream *)stream2 stream:(RIBStream *)stream3 block:(id _Nullable(^)(id _Nullable object1, id _Nullable object2, id _Nullable object3))block;
+ (RIBStream *)reduce3:(RIBStream *)stream1 stream:(RIBStream *)stream2 stream:(RIBStream *)stream3 stream:(RIBStream *)stream4 block:(id _Nullable(^)(id _Nullable object1, id _Nullable object2, id _Nullable object3, id _Nullable object4))block;
+ (RIBStream *)reduce4:(RIBStream *)stream1 stream:(RIBStream *)stream2 stream:(RIBStream *)stream3 stream:(RIBStream *)stream4 stream:(RIBStream *)stream5 block:(id _Nullable(^)(id _Nullable object1, id _Nullable object2, id _Nullable object3, id _Nullable object4, id _Nullable object5))block;
+ (RIBStream *)reduce5:(RIBStream *)stream1 stream:(RIBStream *)stream2 stream:(RIBStream *)stream3 stream:(RIBStream *)stream4 stream:(RIBStream *)stream5 stream:(RIBStream *)stream6 block:(id _Nullable(^)(id _Nullable object1, id _Nullable object2, id _Nullable object3, id _Nullable object4, id _Nullable object5, id _Nullable object6))block;

@end

NS_ASSUME_NONNULL_END
