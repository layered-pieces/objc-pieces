//
//  SettingsPresenter.m
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "SettingsPresenter.h"

@implementation SettingsPresenter

- (instancetype)init
{
    SettingsViewController *viewController = [[SettingsViewController alloc] init];
    viewController.delegate = self;

    if (self = [super initWithViewController:viewController]) {
        viewController.color = [[NSUserDefaults standardUserDefaults] stringForKey:@"settings.color"];
    }
    return self;
}

@end

@implementation SettingsPresenter (SettingsViewControllerDelegate)

- (void)settingsViewController:(SettingsViewController *)viewController didSelectColor:(NSString *)color
{
    [[NSUserDefaults standardUserDefaults] setObject:color forKey:@"settings.color"];
}

@end
