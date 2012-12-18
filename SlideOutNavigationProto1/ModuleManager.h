//
//  ModuleManager.h
//  SlideOutNavigationProto1
//
//  Created by Anthony Picciano on 12/18/12.
//  Copyright (c) 2012 Anthony Picciano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModuleManager : NSObject

+ (ModuleManager *)sharedModuleManager;

- (UIViewController *)defaultController;
- (UIViewController *)controllerAtIndex:(NSInteger)index;
- (NSInteger)numberOfSections;
- (NSInteger)numberOfModulesInSection:(NSInteger)section;
- (NSString *)moduleDisplayNameAtIndexPath:(NSIndexPath *)indexPath;

@end
