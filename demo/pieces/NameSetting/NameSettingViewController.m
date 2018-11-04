//
//  NameSettingViewController.m
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "NameSettingViewController.h"

@interface NameSettingViewController ()

@property (nonatomic, readonly) UITextField *textField;

@end


@implementation NameSettingViewController

#pragma setters and getters

- (void)setName:(NSString *)name
{
    _name = name;
    
    if (self.isViewLoaded) {
        [self _updateViewFromCurrentState];
    }
}

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
    _textField.placeholder = NSLocalizedString(@"Name", @"");
    [_textField addTarget:self action:@selector(_textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:_textField];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    [self _updateViewFromCurrentState];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    CGRect bounds = self.view.bounds;
    self.textField.frame = CGRectMake(CGRectGetMidX(bounds) - 100.0, CGRectGetMidY(bounds) - 22.0, 200.0, 44.0);
}

#pragma private category implementation ()

- (void)_textFieldChanged:(UITextField *)sender
{
    _name = sender.text ?: @"No name";
    [self.delegate nameSettingViewController:self didChangeName:_name];
}

- (void)_updateViewFromCurrentState
{
    self.textField.text = self.name;
}

@end
