//
//  RIBViewingInteractor.h
//  pieces
//
//  Created by Oliver Letterer on 03.11.18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <pieces/RIBInteractor.h>
#import <pieces/RIBViewablePresenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RIBViewingInteractor<Router, Presenter: RIBViewablePresenter *> : RIBInteractor<Router>

@property (nonatomic, readonly) Presenter presenter;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithPresenter:(Presenter)presenter NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
