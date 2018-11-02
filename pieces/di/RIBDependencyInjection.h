//
//  RIBDependencyInjection.h
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RIBDependencyInjection : NSObject

@property (nonatomic, class) NSDictionary<NSString *, NSArray<NSString *> *> *dependencyGraph;
+ (void)addDependencyPath:(Class)klass properties:(NSArray<NSString *> *)properties;

@end


@interface NSObject (RIBDependencyInjection)

+ (BOOL)resolveInjectedProperty:(SEL)selector;

@end

NS_ASSUME_NONNULL_END
