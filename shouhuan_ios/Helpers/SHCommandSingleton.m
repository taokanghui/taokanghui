//
//  SHCommandSingleton.m
//  shouhuan_ios
//
//  Created by hulianxinMac on 2018/1/17.
//  Copyright © 2018年 hulianxinMac. All rights reserved.
//

#import "SHCommandSingleton.h"
#import "SHCommand.h"

@implementation SHCommandSingleton

// MARK: 获取单例
+ (instancetype)sharedInstance {
    static SHCommandSingleton *singletonInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        singletonInstance = [[self alloc] init];
    });
    
    return singletonInstance;
}

// MARK: 执行一个命令
- (void)executeCommandWithCommandObject:(id)command {
    if ([command conformsToProtocol:@protocol(SHCommand)]) {
        [command execute];
    }
}

@end
