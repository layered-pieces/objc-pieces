//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "___VARIABLE_productName___Router.h"
#import "___VARIABLE_productName___Interactor.h"
#import "___VARIABLE_productName___Presenter.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface ___VARIABLE_productName___Builder : NSObject <RIBBuilder>

+ (___VARIABLE_productName___Router *)buildWithDelegate:(id<___VARIABLE_productName___InteractorDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
