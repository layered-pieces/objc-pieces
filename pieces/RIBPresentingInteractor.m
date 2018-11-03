//
//  RIBPresentingInteractor.m
//  pieces
//
//  Created by Oliver Letterer on 03.11.18.
//

#import "RIBPresentingInteractor.h"

@implementation RIBPresentingInteractor

- (instancetype)initWithPresenter:(RIBPresentablePresenter *)presenter
{
    if (self = [super init]) {
        _presenter = presenter;
        _presenter.interactor = self;
    }
    return self;
}

@end
