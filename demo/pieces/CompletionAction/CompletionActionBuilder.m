//
//  CompletionActionBuilder.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "CompletionActionBuilder.h"

@interface CompletionActionBuilder ()

@end

@implementation CompletionActionBuilder

+ (CompletionActionRouter *)buildWithBlock:(dispatch_block_t)block
{
    CompletionActionInteractor *interactor = [[CompletionActionInteractor alloc] initWithBlock:block];
    CompletionActionRouter *router = [[CompletionActionRouter alloc] initWithInteractor:interactor];

    return router;
}

@end
