//
//  SHAppDelegate.m
//  shouhuan_ios
//
//  Created by hulianxinMac on 2018/1/17.
//  Copyright © 2018年 hulianxinMac. All rights reserved.
//

#import "SHAppDelegate.h"
#import "<#header#>"

@implementation SHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // MARK: Launch Setup
    [DSCommandHelper executeCommands:launchOptions];

    return YES;
}

@end