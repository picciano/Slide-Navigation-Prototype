//
//  Module.h
//  SlideOutNavigationProto1
//
//  Created by Anthony Picciano on 12/18/12.
//  Copyright (c) 2012 Anthony Picciano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Module : NSObject

@property (strong, nonatomic) NSString *displayName;
@property (strong, nonatomic) NSString *className;
@property (nonatomic) BOOL useNavigationController;

+ (Module *)moduleWithDisplayName:(NSString *)displayName className:(NSString *)className;
+ (Module *)moduleWithDisplayName:(NSString *)displayName className:(NSString *)className useNavigationController:(BOOL)useNavigationController;

- (Module *)initWithDisplayName:(NSString *)displayName className:(NSString *)className;
- (Module *)initWithDisplayName:(NSString *)displayName className:(NSString *)className useNavigationController:(BOOL)useNavigationController;

@end
