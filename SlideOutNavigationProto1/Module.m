//
//  Module.m
//  SlideOutNavigationProto1
//
//  Created by Anthony Picciano on 12/18/12.
//  Copyright (c) 2012 Anthony Picciano. All rights reserved.
//

#import "Module.h"

@implementation Module
@synthesize displayName = _displayName;
@synthesize className = _className;
@synthesize useNavigationController = _useNavigationController;

- (Module *)initWithDisplayName:(NSString *)displayName className:(NSString *)className
{
    return [self initWithDisplayName:displayName className:className useNavigationController:NO];
}

- (Module *)initWithDisplayName:(NSString *)displayName className:(NSString *)className useNavigationController:(BOOL)useNavigationController
{
    self = [super init];
    if (self)
    {
        [self setDisplayName:displayName];
        [self setClassName:className];
        [self setUseNavigationController:useNavigationController];
    }
    return self;
}

+ (Module *)moduleWithDisplayName:(NSString *)displayName className:(NSString *)className
{
    return [[Module alloc] initWithDisplayName:displayName className:className];
}

+ (Module *)moduleWithDisplayName:(NSString *)displayName className:(NSString *)className useNavigationController:(BOOL)useNavigationController
{
    return [[Module alloc] initWithDisplayName:displayName className:className useNavigationController:useNavigationController];
}

@end
