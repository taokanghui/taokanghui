//
//  SHCommandHelper.h
//  shouhuan_ios
//
//  Created by hulianxinMac on 2018/1/17.
//  Copyright © 2018年 hulianxinMac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SHCommandSingleton.h"
#import "SHAppLaunchSettingCommand.h"

@interface SHCommandHelper : NSObject

// MARK: 命令集执行
+ (void)executeCommands:(NSDictionary *)launchOptions;

// MARK: 单条命令执行
+ (void)executeCommand:(id)command;


@end
