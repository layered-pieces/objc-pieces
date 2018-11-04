//
//  RIBDependencyContainer.h
//  pieces
//
//  Created by Oliver Letterer on 03.11.18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RIBDependencyGraph;

@protocol RIBDependencyContainer <NSObject>

@property (nonatomic, nullable, class, readonly) RIBDependencyGraph *dependencyGraph;

+ (void)registerInjectableDependency:(NSString *)dependency;
- (void)rib_injectedDependencyDidChange:(NSString *)dependency;

@end

NS_ASSUME_NONNULL_END
