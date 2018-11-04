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
    ___VARIABLE_productName___ViewController *viewController = [[___VARIABLE_productName___ViewController alloc] init];
    viewController.delegate = self;

    if (self = [super initWithViewController:viewController]) {
        _delegate = delegate;
    }
    return self;
}

@end

@implementation ___VARIABLE_productName___Interactor (___VARIABLE_productName___ViewControllerDelegate)

@end
