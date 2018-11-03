//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "___VARIABLE_productName___View.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

@class ___VARIABLE_productName___Router;

__attribute__((objc_subclassing_restricted))
@interface ___VARIABLE_productName___Interactor : RIBViewableInteractor<___VARIABLE_productName___Router *, ___VARIABLE_productName___View *>

- (instancetype)init NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithView:(___VARIABLE_productName___View *)view NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;

@end

@interface ___VARIABLE_productName___Interactor (___VARIABLE_productName___ViewDelegate) <___VARIABLE_productName___ViewDelegate>

@end

NS_ASSUME_NONNULL_END
