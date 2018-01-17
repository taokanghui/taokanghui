//
//  NSObject+OrderEx.h
//  DSports
//
//  Created by wujianming on 16/12/14.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (OrderEx)

- (NSString *)orderTypeString:(NSInteger)type;
- (NSString *)orderStateString:(NSInteger)state;
- (NSString *)orderPayWayString:(NSInteger)payWay;

@end
