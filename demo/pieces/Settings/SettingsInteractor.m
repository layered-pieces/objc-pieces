//
//  SettingsInteractor.m
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "SettingsInteractor.h"
#import "SettingsRouter.h"

@interface SettingsInteractor ()

@end

@implementation SettingsInteractor

- (instancetype)initWithPresenter:(SettingsPresenter *)presenter delegate:(id<SettingsInteractorDelegate>)delegate
{
    if (self = [super initWithPresenter:presenter]) {
        _delegate = delegate;
        presenter.delegate = self;
        
        __weak typeof(self) welf = self;
        _complectionAction = ^{
            [welf.delegate settingsInteractorIsDone:welf];
        };
    }
    return self;
}

@end

@implementation SettingsInteractor (SettingsPresenterDelegate)

@end
