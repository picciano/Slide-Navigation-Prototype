//
//  AppDelegate.h
//  SlideOutNavigationProto1
//
//  Created by Anthony Picciano on 12/17/12.
//  Copyright (c) 2012 Anthony Picciano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"

#define app_delegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MenuViewController *menuViewController;
@property (strong, nonatomic) UIViewController *contentViewController;

@end
