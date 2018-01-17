//
//  SHCommandSingleton.h
//  shouhuan_ios
//
//  Created by hulianxinMac on 2018/1/17.
//  Copyright © 2018年 hulianxinMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHCommandSingleton : NSObject


+ (instancetype)sharedInstance;
- (void)executeCommandWithCommandObject:(id)command;

@end
