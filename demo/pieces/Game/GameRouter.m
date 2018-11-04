//
//  GameRouter.m
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "GameRouter.h"

@interface GameRouter ()

@end

@implementation GameRouter
@dynamic applicationEnvironment;

- (instancetype)initWithInteractor:(GameInteractor *)interactor completion:(nonnull dispatch_block_t)completion
{
    if (self = [super initWithInteractor:interactor]) {
        _completion = completion;
    }
    return self;
}

- (void)routeToCompletionWithResult:(BOOL)success
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:success ? NSLocalizedString(@"Success", @"") : NSLocalizedString(@"Lost", @"")
                                                                   message:success ? NSLocalizedString(@"You won the game, congratz :)", @"") : NSLocalizedString(@"You lost the game, maybe try another round? ;)", @"")
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.completion();
    }]];
    
    [self.applicationEnvironment presentViewController:alert animated:YES];
}

@end
