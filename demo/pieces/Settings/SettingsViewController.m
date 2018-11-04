//
//  SettingsViewController.m
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (nonatomic, readonly) UISegmentedControl *segmentedContol;
@property (nonatomic, readonly) UIView *colorView;

@end


@implementation SettingsViewController

#pragma setters and getters

- (void)setColor:(NSString *)color
{
    if (color != _color) {
        _color = color ?: @"blue";
        
        if (self.isViewLoaded) {
            [self _updateViewFromCurrentState];
        }
    }
}

#pragma initialisation

- (instancetype)init
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _color = @"blue";
        self.title = NSLocalizedString(@"Settings", @"");
    }
    return self;
}

#pragma view lifecycle

- (void)loadView
{
    [super loadView];

    _segmentedContol = [[UISegmentedControl alloc] initWithItems:@[ @"red", @"blue", @"green" ]];
    [_segmentedContol addTarget:self action:@selector(_segmentChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentedContol];
    
    _colorView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_colorView];
    
    [self.view addSubview:self.colorView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self _updateViewFromCurrentState];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    CGRect bounds = self.view.bounds;

    CGSize size = [self.segmentedContol sizeThatFits:CGSizeMake(CGRectGetWidth(bounds), 100.0)];
    self.segmentedContol.frame = CGRectMake(CGRectGetMidX(bounds) - size.width / 2.0, 100.0, size.width, size.height);
    
    CGFloat dimension = 200.0;
    self.colorView.frame = CGRectMake(CGRectGetMidX(bounds) - dimension / 2.0, CGRectGetMaxY(self.segmentedContol.frame) + 16.0, dimension, dimension);
}

#pragma private category implementation ()

- (void)_segmentChanged:(UISegmentedControl *)sender
{
    self.color = [sender titleForSegmentAtIndex:sender.selectedSegmentIndex];
    [self _updateViewFromCurrentState];
    
    [self.delegate settingsViewController:self didSelectColor:[sender titleForSegmentAtIndex:sender.selectedSegmentIndex]];
}

- (void)_updateViewFromCurrentState
{
    self.colorView.backgroundColor = [(id)[UIColor class] valueForKey:[NSString stringWithFormat:@"%@Color", self.color]];
    
    for (NSUInteger i = 0; i < self.segmentedContol.numberOfSegments; i++) {
        if ([[self.segmentedContol titleForSegmentAtIndex:i] isEqualToString:self.color]) {
            [self.segmentedContol setSelectedSegmentIndex:i];
        }
    }
}

@end
