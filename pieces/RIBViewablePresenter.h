//
//  RIBViewablePresenter.h
//  pieces
//
//  Created by Oliver Letterer on 03.11.18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RIBViewablePresenter<Interactor, View: UIView *> : NSObject

@property (nonatomic, weak) Interactor interactor;

@property (nonatomic, readonly) View view;

- (instancetype)init NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithView:(View)view NS_DESIGNATED_INITIALIZER;

@end


@interface UIView (RIBViewablePresenter)

@property (nonatomic, weak) RIBViewablePresenter *presenter;

@end

NS_ASSUME_NONNULL_END
