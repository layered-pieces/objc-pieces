//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_productName___Presenter.h"

@implementation ___VARIABLE_productName___Presenter

- (instancetype)init
{
    ___VARIABLE_productName___View *view = [[___VARIABLE_productName___View alloc] initWithFrame:CGRectZero];
    view.delegate = self;

    if (self = [super initWithView:view]) {

    }
    return self;
}

@end

@implementation ___VARIABLE_productName___Presenter (___VARIABLE_productName___ViewDelegate)

@end
