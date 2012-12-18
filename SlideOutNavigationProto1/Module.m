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

- (Module *)initWithDisplayName:(NSString *)displayName className:(NSString *)className
{
    self = [super init];
    if (self)
    {
        [self setDisplayName:displayName];
        [self setClassName:className];
    }
    return self;
}

+ (Module *)moduleWithDisplayName:(NSString *)displayName className:(NSString *)className
{
    return [[Module alloc] initWithDisplayName:displayName className:className];
}

@end
