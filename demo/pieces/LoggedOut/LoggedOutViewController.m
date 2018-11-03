//
//  LoggedOutViewController.m
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import "LoggedOutViewController.h"

@interface LoggedOutViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *button;

@end

@implementation LoggedOutViewController

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
    
    _textField = [[UITextField alloc] initWithFrame:CGRectZero];
    _textField.placeholder = NSLocalizedString(@"Enter your name", @"");
    [self.view addSubview:_textField];
    
    _button = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button setTitle:NSLocalizedString(@"Login", @"") forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(_buttonTapped:) forControlEvents:UIControlEventPrimaryActionTriggered];
    [self.view addSubview:_button];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGRect bounds = self.view.bounds;
    self.textField.frame = CGRectMake(16.0, 50.0, CGRectGetWidth(bounds) - 2.0 * 16.0, 44.0);
    self.button.frame = CGRectMake(16.0, CGRectGetMaxY(self.textField.frame) + 8.0, CGRectGetWidth(bounds) - 2.0 * 16.0, 44.0);
}

#pragma private category implementation ()

- (void)_buttonTapped:(UIButton *)sender
{
    if (self.textField.text.length > 0) {
        [self.delegate loggedOutViewController:self didLoginWithName:self.textField.text];
    }
}

@end
