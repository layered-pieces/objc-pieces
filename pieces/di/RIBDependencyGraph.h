//
//  RIBDependencyInjection.h
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RIBDependencyNode : NSObject

@property (nonatomic, readonly) Class klass;

@property (nonatomic, nullable, readonly) NSString *parent;
@property (nonatomic, readonly) NSOrderedSet<NSString *> *children;

@end

@interface RIBDependency : NSObject

@property (nonatomic, readonly) Class klass;

@property (nonatomic, readonly) NSString *property;
@property (nonatomic, readonly) NSString *type;

@end

@interface RIBDependencyGraph : NSObject

@property (nonatomic, readonly) NSDictionary<NSString *, RIBDependencyNode *> *graph;

- (void)klass:(Class)klass registerParent:(NSString *)parent;
- (void)klass:(Class)klass registerChildren:(NSArray<NSString *> *)children;

@property (nonatomic, readonly) NSDictionary<NSString *, NSDictionary<NSString *, RIBDependency *> *> *dependencies;

- (void)klass:(Class)klass registerDependency:(NSString *)dependency;
- (BOOL)containsDependency:(NSString *)dependency type:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
