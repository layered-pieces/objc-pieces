//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ___VARIABLE_productName___ViewController;

@protocol ___VARIABLE_productName___ViewControllerDelegate <NSObject>

@end

__attribute__((objc_subclassing_restricted))
@interface ___VARIABLE_productName___ViewController : UIViewController

@property (nonatomic, weak) id<___VARIABLE_productName___ViewControllerDelegate> delegate;

- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
