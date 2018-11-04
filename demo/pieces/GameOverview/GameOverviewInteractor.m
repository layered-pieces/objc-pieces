//
//  GameOverviewInteractor.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "GameOverviewInteractor.h"
#import "GameOverviewRouter.h"

@interface GameOverviewInteractor ()

@property (nonatomic, readonly) NSString *backgroundColor;
@property (nonatomic, readonly) NSString *playerName;

@end

@implementation GameOverviewInteractor
@dynamic backgroundColor, playerName;

- (instancetype)init
{
    GameOverviewViewController *viewController = [[GameOverviewViewController alloc] init];
    viewController.delegate = self;

    if (self = [super initWithViewController:viewController]) {
        if (self.backgroundColor != nil) {
            viewController.title = self.playerName;
            viewController.view.backgroundColor = [(id)[UIColor class] valueForKey:[NSString stringWithFormat:@"%@Color", self.backgroundColor]];
        }
    }
    return self;
}

- (void)rib_injectedDependencyDidChange:(NSString *)dependency
{
    self.viewController.title = self.playerName;
    self.viewController.view.backgroundColor = [(id)[UIColor class] valueForKey:[NSString stringWithFormat:@"%@Color", self.backgroundColor]];
}

@end

@implementation GameOverviewInteractor (GameOverviewViewControllerDelegate)

@end
