//
//  runtime.h
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import <Foundation/Foundation.h>

@protocol RIBDependencyContainer;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - runtime helpers

// YES if the property is dynamically implemented
BOOL rib_propertyIsDynamic(Class klass, NSString *property);

// Returns the objc encoded type of the property
NSString *rib_propertyCopyType(Class klass, NSString *property);

// YES iff klass or one of its super classes conforms to protocol
BOOL rib_classConformsToProtocol(Class klass, Protocol *protocol);

#pragma mark - dependency resolution

// Navigates the dependeny tree upwards to find the dependency from a parent
id _Nullable rib_resolveDependency(id<RIBDependencyContainer> object, NSString *property, NSString *type);

// Implements a custom setter to notify the dependency graph about the change
BOOL rib_implementDependencyObserver(Class klass, NSString *dependency);

// Navigates the dependency tree and informs listening children about changes
void rib_dependencyDidChange(id<RIBDependencyContainer> object, NSString *property);

#pragma mark - property injection

// Enumerates the class list and implements all properties that can by injected
void rib_implementInjectedPropertiesInImage(NSString *image);

// Implements a single injected property
BOOL rib_implementInjectedProperty(Class klass, NSString *property);

NS_ASSUME_NONNULL_END
