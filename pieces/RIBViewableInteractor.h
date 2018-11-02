//
//  RIBViewableInteractor.h
//  pieces
//
//  Created by Oliver Letterer on 02.11.18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <pieces/RIBInteractor.h>

NS_ASSUME_NONNULL_BEGIN

@interface RIBViewableInteractor<Router, View: UIView *> : RIBInteractor<Router>

@property (nonatomic, readonly) View view;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithView:(View)view NS_DESIGNATED_INITIALIZER;

@end


@interface UIView (RIBViewableInteractor)

@property (nonatomic, weak) RIBViewableInteractor *interactor;

@end

NS_ASSUME_NONNULL_END
