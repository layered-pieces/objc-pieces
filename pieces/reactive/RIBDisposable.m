//
//  RIBDisposable.m
//  pieces
//
//  Created by Oliver Letterer on 21.11.18.
//

#import "RIBDisposable.h"
#import "RIBDisposableBag.h"

@interface _RIBGenericDisposable : NSObject <RIBDisposable>

@property (nonatomic, readonly) NSUUID *uuid;
@property (nonatomic, readonly) void(^block)(id<RIBDisposable> disposable);

@end

@implementation _RIBGenericDisposable

- (instancetype)initWithBlock:(void(^)(id<RIBDisposable> disposable))block
{
    return [self initWithUUID:NSUUID.UUID block:block];
}

- (instancetype)initWithUUID:(NSUUID *)uuid block:(void(^)(id<RIBDisposable> disposable))block
{
    if (self = [super init]) {
        _uuid = uuid;
        _block = block;
    }
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone
{
    return [[_RIBGenericDisposable allocWithZone:zone] initWithUUID:self.uuid block:self.block];
}

- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:_RIBGenericDisposable.class]) {
        return [self isEqualToGenericDisposable:object];
    }
    
    return [super isEqual:object];
}

- (BOOL)isEqualToGenericDisposable:(_RIBGenericDisposable *)object
{
    return [self.uuid isEqual:object.uuid];
}

- (void)dispose
{
    self.block(self);
}

- (void)addToBag:(RIBDisposableBag *)bag
{
    [bag addDisposable:self];
}

@end

@implementation RIBDisposable

+ (id<RIBDisposable>)disposableWithBlock:(void(^)(id<RIBDisposable> disposable))block
{
    return [[_RIBGenericDisposable alloc] initWithBlock:block];
}

@end
