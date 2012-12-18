//
//  MenuViewController.h
//  SlideOutNavigationProto1
//
//  Created by Anthony Picciano on 12/17/12.
//  Copyright (c) 2012 Anthony Picciano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController <UIGestureRecognizerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIImageView *screenShotImageView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIImage *screenShotImage;
@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;

@end
