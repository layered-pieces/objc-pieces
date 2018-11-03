//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_productName___Builder.h"

@interface ___VARIABLE_productName___Builder ()

@end

@implementation ___VARIABLE_productName___Builder

+ (___VARIABLE_productName___Router *)build
{
    ___VARIABLE_productName___Presenter *presenter = [[___VARIABLE_productName___Presenter alloc] init];
    ___VARIABLE_productName___Interactor *interactor = [[___VARIABLE_productName___Interactor alloc] initWithPresenter:presenter];
    ___VARIABLE_productName___Router *router = [[___VARIABLE_productName___Router alloc] initWithInteractor:interactor];

    return router;
}

@end
