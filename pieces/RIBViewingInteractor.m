//
//  RIBViewingInteractor.m
//  pieces
//
//  Created by Oliver Letterer on 03.11.18.
//

#import "RIBViewingInteractor.h"

@implementation RIBViewingInteractor

- (instancetype)initWithPresenter:(RIBViewablePresenter *)presenter
{
    if (self = [super init]) {
        _presenter = presenter;
        _presenter.interactor = self;
    }
    return self;
}

@end
