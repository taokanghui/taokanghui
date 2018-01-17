//
//  NSArray+Chinese.h
//  AFNTestDemo
//
//  Created by wujianming on 16/9/20.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Ex)

- (NSArray *)mas_distributeSudokuViewsWithFixedItemWidth:(CGFloat)fixedItemWidth
                                         fixedItemHeight:(CGFloat)fixedItemHeight
                                        fixedLineSpacing:(CGFloat)fixedLineSpacing
                                   fixedInteritemSpacing:(CGFloat)fixedInteritemSpacing
                                               warpCount:(NSInteger)warpCount
                                              topSpacing:(CGFloat)topSpacing
                                           bottomSpacing:(CGFloat)bottomSpacing
                                             leadSpacing:(CGFloat)leadSpacing
                                             tailSpacing:(CGFloat)tailSpacing;

@end
