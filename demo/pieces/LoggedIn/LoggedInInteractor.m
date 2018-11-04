//
//  LoggedInInteractor.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "LoggedInInteractor.h"

#import "LoggedInRouter.h"

@implementation LoggedInInteractor
@synthesize navigationController = _navigationController;

- (instancetype)init
{
    if (self = [super init]) {
        _navigationController = [[UINavigationController alloc] init];
    }
    return self;
}

@end
