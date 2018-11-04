//
//  SettingsActionInteractor.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "SettingsActionInteractor.h"

#import "SettingsActionRouter.h"

@implementation SettingsActionInteractor

- (instancetype)initWithBlock:(dispatch_block_t)block
{
    if (self = [super init]) {
        _block = block;
        _barButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Settings", @"") style:UIBarButtonItemStylePlain target:self action:@selector(_tapped:)];
    }
    return self;
}

- (void)_tapped:(UIBarButtonItem *)sender
{
    self.block();
}

@end
