//
//  UIViewController+SlideMenu.m
//  SlideOutNavigationProto1
//
//  Created by Anthony Picciano on 12/18/12.
//  Copyright (c) 2012 Anthony Picciano. All rights reserved.
//

#import "UIViewController+SlideMenu.h"

@implementation UIViewController (SlideMenu)

- (IBAction)slideMenuButtonTouched:(id)sender
{
    // before swaping the views, we'll take a "screenshot" of the current view
    // by rendering its CALayer into the an ImageContext then saving that off to a UIImage
    CGSize viewSize = app_delegate.contentViewController.view.bounds.size;
    NSLog(@"viewSize width:%f height %f", viewSize.width, viewSize.height);
    UIGraphicsBeginImageContextWithOptions(viewSize, NO, 1.0);
    [app_delegate.contentViewController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // Read the UIImage object
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // pass this image off to the MenuViewController then swap it in as the rootViewController
    app_delegate.menuViewController.screenShotImage = image;
    app_delegate.window.rootViewController = app_delegate.menuViewController;
}

@end
