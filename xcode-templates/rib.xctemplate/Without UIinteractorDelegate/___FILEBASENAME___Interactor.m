//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_productName___Interactor.h"
#import "___VARIABLE_productName___Router.h"

@implementation ___VARIABLE_productName___Interactor

- (instancetype)initWithDelegate:(id<___VARIABLE_productName___InteractorDelegate>)delegate
{
    if (self = [super init]) {
        _delegate = delegate;
    }
    return self;
}

@end
