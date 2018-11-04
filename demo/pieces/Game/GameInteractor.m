//
//  GameInteractor.m
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "GameInteractor.h"
#import "GameRouter.h"

#define ARC4RANDOM_MAX      0x100000000

@implementation GameInteractor

- (instancetype)init
{
    if (self = [super init]) {

    }
    return self;
}

- (void)didActivate
{
    double val = ((double)arc4random() / ARC4RANDOM_MAX);
    [self.router routeToCompletionWithResult:val < 0.5];
}

@end
