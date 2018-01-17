//
//  SHAppLaunchSettingCommand.m
//  shouhuan_ios
//
//  Created by hulianxinMac on 2018/1/17.
//  Copyright © 2018年 hulianxinMac. All rights reserved.
//

#import "SHAppLaunchSettingCommand.h"
#import "SHAppDelegate.h"
#import "BaseTabBarController.h"

@implementation SHAppLaunchSettingCommand


// MARK: 获取单例
+ (instancetype)sharedInstance {
    static SHAppLaunchSettingCommand *singletonInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singletonInstance = [[self alloc] init];
    });
    
    return singletonInstance;
}

// MARK: 协议方法
- (void)execute {
    
    // MARK: RootController Init
    SHAppDelegate *delegate = (SHAppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    delegate.window.rootViewController = [[BaseTabBarController alloc] init];
    [delegate.window makeKeyAndVisible];
    
    // MARK: Bugly Register
    //    [Bugly startWithAppId:@"2d58154ae7"];
}


@end
