//
//  GameBuilder.m
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "GameBuilder.h"

@interface GameBuilder ()

@end

@implementation GameBuilder

+ (GameRouter *)buildWithCompletion:(dispatch_block_t)completion
{
    GameInteractor *interactor = [[GameInteractor alloc] init];
    GameRouter *router = [[GameRouter alloc] initWithInteractor:interactor completion:completion];

    return router;
}

@end
