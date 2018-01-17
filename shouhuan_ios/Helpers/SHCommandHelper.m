//
//  SHCommandHelper.m
//  shouhuan_ios
//
//  Created by hulianxinMac on 2018/1/17.
//  Copyright © 2018年 hulianxinMac. All rights reserved.
//

#import "SHCommandHelper.h"

@implementation SHCommandHelper

// MARK: 执行命令集
+ (void)executeCommands:(NSDictionary *)launchOptions {
    id command = nil;
    SHCommandSingleton *commandManager = [SHCommandSingleton sharedInstance];
    
    // MARK: Wifi Config
    //[WIFISetupHelper checkHostCache];
    
    // MARK: App Config
    command = [SHAppLaunchSettingCommand sharedInstance];
    [commandManager executeCommandWithCommandObject:command];
    
 
    
    
}

+ (void)executeCommand:(id)command {
    SHCommandSingleton *commandManager = [SHCommandSingleton sharedInstance];
    [commandManager executeCommandWithCommandObject:command];
}


@end
