//
//  ModuleManager.m
//  SlideOutNavigationProto1
//
//  Created by Anthony Picciano on 12/18/12.
//  Copyright (c) 2012 Anthony Picciano. All rights reserved.
//

#import "ModuleManager.h"
#import "Module.h"
#import "SynthesizeSingleton.h"
#import "RedViewController.h"

@interface ModuleManager()
@property (strong, nonatomic) NSArray *modules;
@property (strong, nonatomic) Module *myPointsModule;
- (void)loadModules;
- (UIViewController *)controllerForClassName:(NSString *)className;
@end

@implementation ModuleManager
@synthesize modules = _modules;

SYNTHESIZE_SINGLETON_FOR_CLASS(ModuleManager)

- (ModuleManager *)init
{
    self = [super init];
    if (self)
    {
        [self loadModules];
    }
    return self;
}

- (UIViewController *)defaultController
{
    return [self controllerAtIndex:0];
}

- (UIViewController *)controllerAtIndex:(NSInteger)index
{
#warning Check for index out of bounds
    
    return [self controllerForClassName:[[self.modules objectAtIndex:index] className]];
}

- (NSInteger)numberOfSections
{
    return 2;
}

- (NSInteger)numberOfModulesInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [self.modules count];
            break;
            
        case 1:
            return 1;
            break;
            
        default:
            break;
    }
    
    return 0;
}

- (NSString *)moduleDisplayNameAtIndexPath:(NSIndexPath *)indexPath
{    
    switch (indexPath.section) {
        case 0:
            return [[self.modules objectAtIndex:indexPath.row] displayName];
            break;
            
        case 1:
            return [self.myPointsModule displayName];
            break;
            
        default:
            break;
    }
    
    return nil;
}

#pragma mark - private methods

- (UIViewController *)controllerForClassName:(NSString *)className
{
    Class controllerClassName = NSClassFromString(className);
    return [[controllerClassName alloc] initWithNibName:nil bundle:nil];
}

- (void)loadModules
{
    // load modules
    // this will be replaced by a call to the snap appy service API
    
    self.modules = [[NSArray alloc] initWithObjects:
                    [Module moduleWithDisplayName:@"Home" className:@"RedViewController"],
                    [Module moduleWithDisplayName:@"Snap" className:@"SnapViewController"],
                    [Module moduleWithDisplayName:@"Shop" className:@"ShopViewController"],
                    [Module moduleWithDisplayName:@"Styles" className:@"StylesViewController"],
                    [Module moduleWithDisplayName:@"Settings" className:@"SettingsViewController"],
                    [Module moduleWithDisplayName:@"About" className:@"AboutViewController"], nil];
    
    self.myPointsModule = [Module moduleWithDisplayName:@"My Points" className:@"MyPointsViewController"];
}

@end
