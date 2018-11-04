//
//  SettingsRouter.m
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "SettingsRouter.h"
#import "CompletionActionBuilder.h"

@interface SettingsRouter ()

@property (nonatomic, readonly) CompletionActionRouter *completionAction;

@end

@implementation SettingsRouter

- (instancetype)initWithInteractor:(SettingsInteractor *)interactor
{
    if (self = [super initWithInteractor:interactor]) {
        _completionAction = [CompletionActionBuilder buildWithBlock:interactor.complectionAction];
        [self attachChild:self.completionAction];
        
        self.interactor.presenter.viewController.navigationItem.rightBarButtonItem = self.completionAction.interactor.barButtonItem;
    }
    return self;
}

@end
