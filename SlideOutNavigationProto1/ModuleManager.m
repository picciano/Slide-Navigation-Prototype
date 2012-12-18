//
//  ModuleManager.m
//  SlideOutNavigationProto1
//
//  Created by Anthony Picciano on 12/18/12.
//  Copyright (c) 2012 Anthony Picciano. All rights reserved.
//

#import "ModuleManager.h"
#import "SynthesizeSingleton.h"
#import "RedViewController.h"

@implementation ModuleManager
SYNTHESIZE_SINGLETON_FOR_CLASS(ModuleManager)

- (UIViewController *)defaultController
{
    return [[RedViewController alloc] init];
}

@end
