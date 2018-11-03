//
//  RIBPresentingInteractor.h
//  pieces
//
//  Created by Oliver Letterer on 03.11.18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <pieces/RIBInteractor.h>
#import <pieces/RIBPresentablePresenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RIBPresentingInteractor<Router, Presenter: RIBPresentablePresenter *> : RIBInteractor<Router>

@property (nonatomic, readonly) Presenter presenter;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithPresenter:(Presenter)presenter NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
