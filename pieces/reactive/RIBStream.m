//
//  RIBStream.m
//  pieces
//
//  Created by Oliver Letterer on 21.11.18.
//

#import "RIBStream.h"
#import "RIBDisposable.h"
#import "RIBDisposableBag.h"

@interface RIBStream ()

@property (nonatomic, nullable) id currentValue;

@property (nonatomic, readonly) NSMutableArray<id<RIBDisposable>> *disposables;
@property (nonatomic, readonly) NSMutableArray<void(^)(id)> *subscribers;

@end

@implementation RIBStream

- (void)postNextValue:(id)nextValue
{
    if (self.currentValue == nextValue || [self.currentValue isEqual:nextValue] || [nextValue isEqual:self.currentValue]) {
        return;
    }
    
    self.currentValue = nextValue;
    [self.subscribers enumerateObjectsUsingBlock:^(void (^ _Nonnull obj)(id), NSUInteger idx, BOOL * _Nonnull stop) {
        obj(nextValue);
    }];
}

- (instancetype)init
{
    return [self initWithInitialValue:nil];
}

- (instancetype)initWithInitialValue:(nullable id)initialValue
{
    if (self = [super init]) {
        _currentValue = initialValue;
        _disposables = [NSMutableArray array];
        _subscribers = [NSMutableArray array];
    }
    
    return self;
}

- (id<RIBDisposable>)subscribeNext:(void (^)(id))block
{
    __weak typeof(self) welf = self;
    __weak __block id<RIBDisposable> weakDisposable = nil;
    
    id<RIBDisposable> disposable = [RIBDisposable disposableWithBlock:^(id<RIBDisposable>  _Nonnull disposable) {
        NSInteger index = [welf.disposables indexOfObject:weakDisposable];
        
        if (index != NSNotFound) {
            [welf.disposables removeObjectAtIndex:index];
            [welf.subscribers removeObjectAtIndex:index];
        }
    }];
    
    [self.disposables addObject:disposable]; [self.subscribers addObject:[block copy]];
    weakDisposable = disposable;

    return disposable;
}

@end

@implementation RIBStream (Functional)

- (RIBStream *)map:(id  _Nonnull (^)(id _Nullable))block
{
    RIBStream *stream = [[RIBStream alloc] initWithInitialValue:block(self.currentValue)];
    
    [[self subscribeNext:^(id  _Nullable next) {
        [stream postNextValue:block(next)];
    }] addToBag:self.disposableBag];
    
    return stream;
}

+ (RIBStream *)reduce:(RIBStream *)stream1 stream:(RIBStream *)stream2 block:(id _Nullable(^)(id _Nullable object1, id _Nullable object2))block
{
    __block id currentValue1 = stream1.currentValue;
    __block id currentValue2 = stream2.currentValue;
    
    RIBStream *stream = [[RIBStream alloc] initWithInitialValue:block(currentValue1, currentValue2)];
    
    [[stream1 subscribeNext:^(id  _Nullable next) {
        currentValue1 = next;
        [stream postNextValue:block(currentValue1, currentValue2)];
    }] addToBag:self.disposableBag];
    
    [[stream2 subscribeNext:^(id  _Nullable next) {
        currentValue2 = next;
        [stream postNextValue:block(currentValue1, currentValue2)];
    }] addToBag:self.disposableBag];
    
    return stream;
}

+ (RIBStream *)reduce2:(RIBStream *)stream1 stream:(RIBStream *)stream2 stream:(RIBStream *)stream3 block:(id  _Nullable (^)(id _Nullable, id _Nullable, id _Nullable))block
{
    __block id currentValue1 = stream1.currentValue;
    __block id currentValue2 = stream2.currentValue;
    __block id currentValue3 = stream3.currentValue;
    
    RIBStream *stream = [[RIBStream alloc] initWithInitialValue:block(currentValue1, currentValue2, currentValue3)];
    
    [[stream1 subscribeNext:^(id  _Nullable next) {
        currentValue1 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3)];
    }] addToBag:self.disposableBag];
    
    [[stream2 subscribeNext:^(id  _Nullable next) {
        currentValue2 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3)];
    }] addToBag:self.disposableBag];
    
    [[stream3 subscribeNext:^(id  _Nullable next) {
        currentValue3 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3)];
    }] addToBag:self.disposableBag];
    
    return stream;
}

+ (RIBStream *)reduce3:(RIBStream *)stream1 stream:(RIBStream *)stream2 stream:(RIBStream *)stream3 stream:(RIBStream *)stream4 block:(id  _Nullable (^)(id _Nullable, id _Nullable, id _Nullable, id _Nullable))block
{
    __block id currentValue1 = stream1.currentValue;
    __block id currentValue2 = stream2.currentValue;
    __block id currentValue3 = stream3.currentValue;
    __block id currentValue4 = stream4.currentValue;
    
    RIBStream *stream = [[RIBStream alloc] initWithInitialValue:block(currentValue1, currentValue2, currentValue3, currentValue4)];
    
    [[stream1 subscribeNext:^(id  _Nullable next) {
        currentValue1 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4)];
    }] addToBag:self.disposableBag];
    
    [[stream2 subscribeNext:^(id  _Nullable next) {
        currentValue2 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4)];
    }] addToBag:self.disposableBag];
    
    [[stream3 subscribeNext:^(id  _Nullable next) {
        currentValue3 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4)];
    }] addToBag:self.disposableBag];
    
    [[stream4 subscribeNext:^(id  _Nullable next) {
        currentValue4 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4)];
    }] addToBag:self.disposableBag];
    
    return stream;
}

+ (RIBStream *)reduce4:(RIBStream *)stream1 stream:(RIBStream *)stream2 stream:(RIBStream *)stream3 stream:(RIBStream *)stream4 stream:(RIBStream *)stream5 block:(id  _Nullable (^)(id _Nullable, id _Nullable, id _Nullable, id _Nullable, id _Nullable))block
{
    __block id currentValue1 = stream1.currentValue;
    __block id currentValue2 = stream2.currentValue;
    __block id currentValue3 = stream3.currentValue;
    __block id currentValue4 = stream4.currentValue;
    __block id currentValue5 = stream5.currentValue;
    
    RIBStream *stream = [[RIBStream alloc] initWithInitialValue:block(currentValue1, currentValue2, currentValue3, currentValue4, currentValue5)];
    
    [[stream1 subscribeNext:^(id  _Nullable next) {
        currentValue1 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4, currentValue5)];
    }] addToBag:self.disposableBag];
    
    [[stream2 subscribeNext:^(id  _Nullable next) {
        currentValue2 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4, currentValue5)];
    }] addToBag:self.disposableBag];
    
    [[stream3 subscribeNext:^(id  _Nullable next) {
        currentValue3 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4, currentValue5)];
    }] addToBag:self.disposableBag];
    
    [[stream4 subscribeNext:^(id  _Nullable next) {
        currentValue4 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4, currentValue5)];
    }] addToBag:self.disposableBag];
    
    [[stream5 subscribeNext:^(id  _Nullable next) {
        currentValue5 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4, currentValue5)];
    }] addToBag:self.disposableBag];
    
    return stream;
}

+ (RIBStream *)reduce5:(RIBStream *)stream1 stream:(RIBStream *)stream2 stream:(RIBStream *)stream3 stream:(RIBStream *)stream4 stream:(RIBStream *)stream5 stream:(RIBStream *)stream6 block:(id  _Nullable (^)(id _Nullable, id _Nullable, id _Nullable, id _Nullable, id _Nullable, id _Nullable))block
{
    __block id currentValue1 = stream1.currentValue;
    __block id currentValue2 = stream2.currentValue;
    __block id currentValue3 = stream3.currentValue;
    __block id currentValue4 = stream4.currentValue;
    __block id currentValue5 = stream5.currentValue;
    __block id currentValue6 = stream6.currentValue;
    
    RIBStream *stream = [[RIBStream alloc] initWithInitialValue:block(currentValue1, currentValue2, currentValue3, currentValue4, currentValue5, currentValue6)];
    
    [[stream1 subscribeNext:^(id  _Nullable next) {
        currentValue1 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4, currentValue5, currentValue6)];
    }] addToBag:self.disposableBag];
    
    [[stream2 subscribeNext:^(id  _Nullable next) {
        currentValue2 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4, currentValue5, currentValue6)];
    }] addToBag:self.disposableBag];
    
    [[stream3 subscribeNext:^(id  _Nullable next) {
        currentValue3 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4, currentValue5, currentValue6)];
    }] addToBag:self.disposableBag];
    
    [[stream4 subscribeNext:^(id  _Nullable next) {
        currentValue4 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4, currentValue5, currentValue6)];
    }] addToBag:self.disposableBag];
    
    [[stream5 subscribeNext:^(id  _Nullable next) {
        currentValue5 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4, currentValue5, currentValue6)];
    }] addToBag:self.disposableBag];
    
    [[stream6 subscribeNext:^(id  _Nullable next) {
        currentValue6 = next;
        [stream postNextValue:block(currentValue1, currentValue2, currentValue3, currentValue4, currentValue5, currentValue6)];
    }] addToBag:self.disposableBag];
    
    return stream;
}

@end
