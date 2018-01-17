//
//  SHCommand.h
//  shouhuan_ios
//
//  Created by hulianxinMac on 2018/1/17.
//  Copyright © 2018年 hulianxinMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark - 命令集协议
/**
 *  命令接口，声明执行的操作
 */

@protocol SHCommand <NSObject>

/**
 *  执行命令对应的操作
 */
- (void)execute;

@end
#pragma mark - 命令集常量
