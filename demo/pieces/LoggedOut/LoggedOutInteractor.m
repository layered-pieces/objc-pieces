//
//  LoggedOutInteractor.m
//  demo
//
//  Created by Oliver Letterer on 02.11.18.
//  Copyright © 2018 objc-pieces. All rights reserved.
//

#import "LoggedOutInteractor.h"
#import "LoggedOutViewController.h"

@interface LoggedOutInteractor ()

@end

@implementation LoggedOutInteractor

- (instancetype)initWithDelegate:(id<LoggedOutInteractorDelegate>)delegate
{
    LoggedOutViewController *viewController = [[LoggedOutViewController alloc] init];
    viewController.delegate = self;
    
    if (self = [super initWithViewController:viewController]) {
        _delegate = delegate;
    }
    return self;
}

@end

@implementation LoggedOutInteractor (LoggedOutViewControllerDelegate)

- (void)loggedOutViewController:(LoggedOutViewController *)viewController didLoginWithName:(NSString *)name
{
    [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"settings.name"];
    [self.delegate loggedOutInteractor:self didLoginWithName:name];
}

@end
