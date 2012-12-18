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
- (void)loadModules;
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
    
    Class controllerClassName = NSClassFromString([[self.modules objectAtIndex:index] className]);
    return [[controllerClassName alloc] initWithNibName:nil bundle:nil];
}

- (NSInteger)numberOfModules
{
    return [self.modules count];
}

- (NSString *)moduleDisplayNameAtIndex:(NSInteger)index
{
#warning Check for index out of bounds
    return [[self.modules objectAtIndex:index] displayName];
}

#pragma mark - private methods

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
                    [Module moduleWithDisplayName:@"About SA" className:@"AboutViewController"], nil];
}

@end
