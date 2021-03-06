//
//  HomeViewController.m
//  SlideOutNavigationProto1
//
//  Created by Anthony Picciano on 12/18/12.
//  Copyright (c) 2012 Anthony Picciano. All rights reserved.
//

#import "HomeViewController.h"
#import "ProductViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self setTitle:@"Home"];
        
        UIBarButtonItem *menuBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"three_lines"] style:UIBarButtonItemStyleBordered target:self action:@selector(slideMenuButtonTouched:)];
        [self.navigationItem setRightBarButtonItem:menuBarButtonItem];
    }
    return self;
}

- (IBAction)selectProduct:(id)sender
{
    ProductViewController *viewController = [[ProductViewController alloc] initWithNibName:nil bundle:nil];
    [viewController setTitle:[[((UIButton *)sender) titleLabel] text]];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
