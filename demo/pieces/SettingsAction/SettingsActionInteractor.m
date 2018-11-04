//
//  SettingsActionInteractor.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "SettingsActionInteractor.h"
#import "SettingsActionRouter.h"

#import "SettingsActionRouter.h"

@implementation SettingsActionInteractor

- (instancetype)init
{
    if (self = [super init]) {
        _barButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Settings", @"") style:UIBarButtonItemStylePlain target:self action:@selector(_tapped:)];
    }
    return self;
}

- (void)_tapped:(UIBarButtonItem *)sender
{
    [self.router routeToSettings];
}

@end

@implementation SettingsActionInteractor (SettingsInteractorDelegate)

- (void)settingsInteractorIsDone:(SettingsInteractor *)interactor
{
    [self.router dismissSettings];
}

@end
