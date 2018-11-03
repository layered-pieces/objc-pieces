//
//  RIBInteractor.h
//  Pods-abstract-demo
//
//  Created by Oliver Letterer on 02.11.18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RIBInteractor<Router> : NSObject

@property (nonatomic, weak) Router router;

@property (nonatomic, readonly) BOOL isActive;

- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end


@interface RIBInteractor (Callbacks)

- (void)willActivate;
- (void)didActivate;

- (void)willDeactivate;
- (void)didDeactivate;

@end

NS_ASSUME_NONNULL_END
