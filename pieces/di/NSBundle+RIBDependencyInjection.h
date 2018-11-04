//
//  NSBundle+RIBDependencyInjection.h
//  pieces
//
//  Created by Oliver Letterer on 03.11.18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (RIBDependencyInjection)

- (void)resolveDependenciesIncludingFrameworks:(BOOL)includeFrameworks;

@end

NS_ASSUME_NONNULL_END
