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

@class ___VARIABLE_productName___Presenter, ___VARIABLE_productName___Interactor;

@protocol ___VARIABLE_productName___PresenterDelegate <NSObject>

@end

__attribute__((objc_subclassing_restricted))
@interface ___VARIABLE_productName___Presenter : RIBViewablePresenter<___VARIABLE_productName___Interactor *, ___VARIABLE_productName___View *>

@property (nonatomic, weak) id<___VARIABLE_productName___PresenterDelegate> delegate;

- (instancetype)init NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithView:(___VARIABLE_productName___View *)view NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;

@end


@interface ___VARIABLE_productName___Presenter (___VARIABLE_productName___ViewDelegate) <___VARIABLE_productName___ViewDelegate>

@end

NS_ASSUME_NONNULL_END
