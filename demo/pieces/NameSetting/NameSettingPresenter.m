//
//  NameSettingPresenter.m
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "NameSettingPresenter.h"

@implementation NameSettingPresenter

- (instancetype)init
{
    NameSettingViewController *viewController = [[NameSettingViewController alloc] init];
    viewController.delegate = self;

    if (self = [super initWithViewController:viewController]) {
        viewController.name = [[NSUserDefaults standardUserDefaults] stringForKey:@"settings.name"];
    }
    return self;
}

@end

@implementation NameSettingPresenter (NameSettingViewControllerDelegate)

- (void)nameSettingViewController:(NameSettingViewController *)viewController didChangeName:(NSString *)name
{
    [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"settings.name"];
}

@end
