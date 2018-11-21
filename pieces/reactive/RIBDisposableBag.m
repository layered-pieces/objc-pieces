//
//  RIBDisposableBag.m
//  pieces
//
//  Created by Oliver Letterer on 21.11.18.
//

#import "RIBDisposableBag.h"
#import "RIBDisposable.h"

#import <objc/runtime.h>

@interface RIBDisposableBag ()

@property (nonatomic, readonly) NSMutableArray<id<RIBDisposable>> *storage;

@end

@implementation RIBDisposableBag

- (NSArray<id<RIBDisposable>> *)disposables
{
    return self.storage.copy;
}

- (instancetype)init
{
    if (self = [super init]) {
        _storage = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithOwner:(id)owner
{
    if (self = [super init]) {
        _storage = [NSMutableArray array];
        
        _owner = owner;
        objc_setAssociatedObject(owner, @selector(disposableBag), self, OBJC_ASSOCIATION_RETAIN);
    }
    return self;
}

- (void)addDisposable:(id<RIBDisposable>)disposable
{
    [self.storage addObject:disposable];
}

- (void)dealloc
{
    for (id<RIBDisposable> disposable in self.disposables) {
        [disposable dispose];
    }
}

@end

@implementation NSObject (RIBDisposableBag)

- (RIBDisposableBag *)disposableBag
{
    return objc_getAssociatedObject(self, @selector(disposableBag)) ?: [[RIBDisposableBag alloc] initWithOwner:self];
}

@end
