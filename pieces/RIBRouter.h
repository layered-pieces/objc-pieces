//
//  RIBRouter.h
//  Pods-abstract-demo
//
//  Created by Oliver Letterer on 02.11.18.
//

#import <Foundation/Foundation.h>

@class RIBInteractor, RIBRouter;

NS_ASSUME_NONNULL_BEGIN

@protocol RIBRootRouter <NSObject>

- (void)launch:(UIWindow *)window;

@end


@interface RIBRouter<Interactor: RIBInteractor *> : NSObject

@property (nonatomic, readonly) Interactor interactor;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithInteractor:(Interactor)interactor NS_DESIGNATED_INITIALIZER;

@property (nonatomic, readonly) NSArray<RIBRouter *> *children;

- (void)attachChild:(RIBRouter *)childRouter NS_REQUIRES_SUPER;
- (void)detachChild:(RIBRouter *)childRouter NS_REQUIRES_SUPER;

@property (nonatomic, weak, readonly) RIBRouter *parent;

@end


@interface RIBRouter (Callbacks)

- (void)didLoad;

- (void)willAttachToParent:(RIBRouter *)parentRouter;
- (void)didAttachToParent:(RIBRouter *)parentRouter;

- (void)willDetachFromParent:(RIBRouter *)parentRouter;
- (void)didDetachFromParent:(RIBRouter *)parentRouter;

@end


@interface UIWindow (RIBRootRouter)

@property (nonatomic, weak) RIBRouter *rootRouter;

@end

NS_ASSUME_NONNULL_END
