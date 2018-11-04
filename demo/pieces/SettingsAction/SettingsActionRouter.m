//
//  SettingsActionRouter.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "SettingsActionRouter.h"
#import "SettingsBuilder.h"

@interface SettingsActionRouter ()

@property (nonatomic, nullable) SettingsRouter *settings;

@end

@implementation SettingsActionRouter
@dynamic applicationEnvironment;

- (void)routeToSettings
{
    assert(self.settings == nil);
    
    self.settings = [SettingsBuilder buildWithDelegate:self.interactor]; [self attachChild:self.settings];
    [self.applicationEnvironment presentViewController:[[UINavigationController alloc] initWithRootViewController:self.settings.interactor.presenter.viewController] animated:YES];
}

- (void)dismissSettings
{
    assert(self.settings != nil);
    
    [self.applicationEnvironment dismissViewControllerAnimated:YES];
    [self detachChild:self.settings]; self.settings = nil;
}

- (instancetype)initWithInteractor:(SettingsActionInteractor *)interactor
{
    if (self = [super initWithInteractor:interactor]) {

    }
    return self;
}

@end
