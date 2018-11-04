//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_productName___Interactor.h"
#import "___VARIABLE_productName___Router.h"

@interface ___VARIABLE_productName___Interactor ()

@end

@implementation ___VARIABLE_productName___Interactor

- (instancetype)initWithDelegate:(id<___VARIABLE_productName___InteractorDelegate>)delegate
{
    ___VARIABLE_productName___View *view = [[___VARIABLE_productName___View alloc] initWithFrame:CGRectZero];
    view.delegate = self;

    if (self = [super initWithView:view]) {
        _delegate = delegate;
    }
    return self;
}

@end

@implementation ___VARIABLE_productName___Interactor (___VARIABLE_productName___ViewDelegate)

@end
