//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "___VARIABLE_productName___Presenter.h"

@import pieces;

NS_ASSUME_NONNULL_BEGIN

@class ___VARIABLE_productName___Interactor, ___VARIABLE_productName___Router;

@protocol ___VARIABLE_productName___InteractorDelegate <NSObject>

@end

__attribute__((objc_subclassing_restricted))
@interface ___VARIABLE_productName___Interactor : RIBPresentingInteractor<___VARIABLE_productName___Router *, ___VARIABLE_productName___Presenter *>

@property (nonatomic, weak, readonly) id<___VARIABLE_productName___InteractorDelegate> delegate;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithPresenter:(___VARIABLE_productName___Presenter *)presenter NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;

- (instancetype)initWithPresenter:(___VARIABLE_productName___Presenter *)presenter delegate:(id<___VARIABLE_productName___InteractorDelegate>)delegate NS_DESIGNATED_INITIALIZER;

@end

@interface ___VARIABLE_productName___Interactor (___VARIABLE_productName___PresenterDelegate) <___VARIABLE_productName___PresenterDelegate>

@end

NS_ASSUME_NONNULL_END
