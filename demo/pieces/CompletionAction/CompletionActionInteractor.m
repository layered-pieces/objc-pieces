//
//  CompletionActionInteractor.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "CompletionActionInteractor.h"

#import "CompletionActionRouter.h"

@implementation CompletionActionInteractor

- (instancetype)initWithBlock:(dispatch_block_t)block
{
    if (self = [super init]) {
        _block = block;
        _barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(_tapped:)];
    }
    return self;
}

- (void)_tapped:(UIBarButtonItem *)sender
{
    self.block();
}

@end
