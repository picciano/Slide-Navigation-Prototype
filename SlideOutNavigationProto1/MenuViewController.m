//
//  MenuViewController.m
//  SlideOutNavigationProto1
//
//  Created by Anthony Picciano on 12/17/12.
//  Copyright (c) 2012 Anthony Picciano. All rights reserved.
//

#import "MenuViewController.h"
#import "ModuleManager.h"

@interface MenuViewController ()
- (void)slideThenHide;
- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer;
@end

@implementation MenuViewController
@synthesize screenShotImageView, tableView = _tableView, screenShotImage, tapGesture, panGesture;
static NSString *CellIdentifier = @"Cell";

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
    
    // create a UITapGestureRecognizer to detect when the screenshot recieves a single tap
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapScreenShot:)];
    [screenShotImageView addGestureRecognizer:tapGesture];
    
    // create a UIPanGestureRecognizer to detect when the screenshot is touched and dragged
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureMoveAround:)];
    [panGesture setMaximumNumberOfTouches:2];
    [panGesture setDelegate:self];
    [screenShotImageView addGestureRecognizer:panGesture];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // when the menu view appears, it will create the illusion that the other view has slide to the side
    // what its actually doing is sliding the screenShotImage passed in off to the side
    [screenShotImageView setImage:self.screenShotImage];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // to start this, we always want the image to be the entire screen, so set it there
    [screenShotImageView setFrame:CGRectMake(0.0f, self.view.frame.size.height - screenShotImage.size.height, self.view.frame.size.width, screenShotImage.size.height)];
    
    // now we'll animate it across to the right over 0.2 seconds with an Ease In and Out curve
    // this uses blocks to do the animation. Inside the block the frame of the UIImageView has its
    // x value changed to where it will end up with the animation is complete.
    // this animation doesn't require any action when completed so the block is left empty
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [screenShotImageView setFrame:CGRectMake(-265.0f, self.view.frame.size.height - screenShotImage.size.height, self.view.frame.size.width, screenShotImage.size.height)];
    } completion:^(BOOL finished){  }];
}

- (void)slideThenHide
{
    // this animates the screenshot back to the left before swappin out the MenuViewController
    // and the saved contentViewController
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [screenShotImageView setFrame:CGRectMake(0.0f, self.view.frame.size.height - screenShotImage.size.height, self.view.frame.size.width, screenShotImage.size.height)];
    } completion:^(BOOL finished){ app_delegate.window.rootViewController = app_delegate.contentViewController; }];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)singleTapScreenShot:(UITapGestureRecognizer *)gestureRecognizer
{
    // on a single tap of the screenshot, assume the user is done viewing the menu
    // and call the slideThenHide function
    [self slideThenHide];
}

- (void)panGestureMoveAround:(UIPanGestureRecognizer *)gesture;
{
    UIView *piece = [gesture view];
    [self adjustAnchorPointForGestureRecognizer:gesture];
    
    if ([gesture state] == UIGestureRecognizerStateBegan || [gesture state] == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [gesture translationInView:[piece superview]];
        [piece setCenter:CGPointMake([piece center].x + translation.x, [piece center].y)];
        [gesture setTranslation:CGPointZero inView:[piece superview]];
    }
    else if ([gesture state] == UIGestureRecognizerStateEnded)
        [self slideThenHide];
}

- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    if ([self.view superview] == nil)
    {
        screenShotImage = nil;
    }
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[ModuleManager sharedModuleManager] numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[ModuleManager sharedModuleManager] numberOfModulesInSection:(NSInteger)section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell.textLabel setText:[[ModuleManager sharedModuleManager] moduleDisplayNameAtIndexPath:indexPath]];
    
    return cell;
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
