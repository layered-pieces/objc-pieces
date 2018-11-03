//
//  RIBPresentablePresenter.h
//  pieces
//
//  Created by Oliver Letterer on 03.11.18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RIBPresentablePresenter<Interactor, ViewController: UIViewController *> : NSObject

@property (nonatomic, weak) Interactor interactor;

@property (nonatomic, readonly) ViewController viewController;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithViewController:(ViewController)viewController NS_DESIGNATED_INITIALIZER;

@end


@interface UIViewController (RIBViewablePresenter)

@property (nonatomic, weak) RIBPresentablePresenter *presenter;

@end


NS_ASSUME_NONNULL_END
