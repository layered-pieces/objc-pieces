//
//  RIBPresentableInteractor.h
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <pieces/RIBInteractor.h>

NS_ASSUME_NONNULL_BEGIN

@interface RIBPresentableInteractor<Router, ViewController: UIViewController *> : RIBInteractor<Router>

@property (nonatomic, readonly) ViewController viewController;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithViewController:(ViewController)viewController NS_DESIGNATED_INITIALIZER;

@end


@interface UIViewController (RIBPresentableInteractor)

@property (nonatomic, weak) RIBPresentableInteractor *interactor;

@end

NS_ASSUME_NONNULL_END
