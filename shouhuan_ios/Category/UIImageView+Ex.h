//
//  UIImageView+Ex.h
//  DSports
//
//  Created by wufeilinMacmini on 16/12/2.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface UIImageView (Ex)
/**
 *  加载图片
 *
 *  @param imageUrl 图片url
 */
- (void)ty_loadImageWithUrl:(NSString *)imageUrl;

/**
 *   加载图片
 *
 *  @param imageUrl 图片地址
 *  @param color    imageView的背景色
 */
- (void)ty_loadImageWithUrl:(NSString *)imageUrl backColor:(UIColor *)color;

/**
 *  加载图片
 *
 *  @param imageUrl 图片地址
 *  @param color    imageView背景色
 *  @param model    imageView填充模式
 */
- (void)ty_loadImageWithUrl:(NSString *)imageUrl backColor:(UIColor *)color contentModel:(UIViewContentMode)model completed:(SDWebImageCompletionBlock)completedBlock;

/**
 *  加载图片
 *
 *  @param imageUrl 图片地址
 *  @param model    图片加载成功imageView填充模式
 */
- (void)ty_loadImageWithUrl:(NSString *)imageUrl contentModel:(UIViewContentMode)model;

- (void)ty_loadImageWithUrl:(NSString *)imageUrl placeholderImage:(NSString *)imageNamed contentModel:(UIViewContentMode)model;

@end
