//
//  NameSettingInteractor.m
//  demo
//
//  Created by Oliver Letterer on 04.11.18.
//  Copyright 2018 objc-pieces. All rights reserved.
//

#import "NameSettingInteractor.h"
#import "NameSettingRouter.h"

@interface NameSettingInteractor ()

@end

@implementation NameSettingInteractor

- (instancetype)initWithPresenter:(NameSettingPresenter *)presenter
{
    if (self = [super initWithPresenter:presenter]) {
        presenter.delegate = self;
    }
    return self;
}

@end

@implementation NameSettingInteractor (NameSettingPresenterDelegate)

@end
