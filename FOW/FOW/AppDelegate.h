//
//  AppDelegate.h
//  FOW
//
//  Created by Anh Quoc on 10/22/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import <UIKit/UIKit.h> 
@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController *controller;
@property (strong, nonatomic) UINavigationController *navigation;

@end
