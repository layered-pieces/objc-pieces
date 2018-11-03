//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "___VARIABLE_productName___Interactor.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface ___VARIABLE_productName___Router : RIBRouter<___VARIABLE_productName___Interactor *>

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithInteractor:(___VARIABLE_productName___Interactor *)interactor NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
