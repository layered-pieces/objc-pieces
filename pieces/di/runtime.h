//
//  runtime.h
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

BOOL rib_classIsBlacklisted(Class klass);

BOOL rib_canResolveDependency(id object, NSString *property);

id rib_resolveDependency(id object, NSString *property);

NS_ASSUME_NONNULL_END
