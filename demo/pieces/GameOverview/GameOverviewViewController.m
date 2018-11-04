//
//  GameOverviewViewController.m
//  demo
//
//  Created by Oliver Letterer on 03.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "GameOverviewViewController.h"

@interface GameOverviewViewController ()

@property (nonatomic, readonly) UIButton *button;

@end


@implementation GameOverviewViewController

#pragma setters and getters

#pragma initialisation

- (instancetype)init
{
    if (self = [super initWithNibName:nil bundle:nil]) {

    }
    return self;
}

#pragma view lifecycle

- (void)loadView
{
    [super loadView];

    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.backgroundColor = UIColor.whiteColor;
    [_button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [_button setTitle:NSLocalizedString(@"Play a game", @"") forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(_buttonTapped:) forControlEvents:UIControlEventPrimaryActionTriggered];
    [self.view addSubview:_button];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    CGRect bounds = self.view.bounds;
    self.button.frame = CGRectMake(CGRectGetMidX(bounds) - 100.0, CGRectGetMidY(bounds) - 22.0, 200.0, 44.0);
}

#pragma private category implementation ()

- (void)_buttonTapped:(UIButton *)sender
{
    [self.delegate gameOverviewViewControllerPlayButtonTapped:self];
}

@end
