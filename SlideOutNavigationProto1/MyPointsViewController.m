//
//  MyPointsViewController.m
//  SlideOutNavigationProto1
//
//  Created by Anthony Picciano on 12/18/12.
//  Copyright (c) 2012 Anthony Picciano. All rights reserved.
//

#import "MyPointsViewController.h"

@interface MyPointsViewController ()

@end

@implementation MyPointsViewController
@synthesize pointsLabel = _pointsLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    // Let's give the user a point for checking their points.
    NSInteger points = [[NSUserDefaults standardUserDefaults] integerForKey:@"USER_POINTS"];
    points++;
    [[NSUserDefaults standardUserDefaults] setInteger:points forKey:@"USER_POINTS"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.pointsLabel setText:[NSString stringWithFormat:@"%i", points]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
