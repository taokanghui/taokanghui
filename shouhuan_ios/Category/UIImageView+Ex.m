//
//  UIImageView+Ex.m
//  DSports
//
//  Created by wufeilinMacmini on 16/12/2.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "UIImageView+Ex.h"


@implementation UIImageView (Ex)

/**
 *  加载图片
 *
 *  @param imageUrl 图片url
 */
- (void)ty_loadImageWithUrl:(NSString *)imageUrl
{
    [self ty_loadImageWithUrl:imageUrl backColor:COLOR_VIEW_BACKGROUND];
}

/**
 *   加载图片
 *
 *  @param imageUrl 图片地址
 *  @param color    加载鲸鱼的背景色
 */
- (void)ty_loadImageWithUrl:(NSString *)imageUrl backColor:(UIColor *)color
{
    [self ty_loadImageWithUrl:imageUrl backColor:color contentModel:UIViewContentModeCenter completed:nil];
}

/**
 *  加载图片
 *
 *  @param imageUrl 图片地址
 *  @param color    加载鲸鱼的背景色
 *  @param model    鲸鱼的填充模式
 */
- (void)ty_loadImageWithUrl:(NSString *)imageUrl backColor:(UIColor *)color contentModel:(UIViewContentMode)model completed:(SDWebImageCompletionBlock)completedBlock
{
    DDLog(@"图片地址：%@",imageUrl);
    self.backgroundColor = color;
    self.contentMode = model;
    [self sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"mr_pic"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) { //图片加载成功还原填充模式
            self.backgroundColor = [UIColor clearColor];
            self.contentMode = UIViewContentModeScaleToFill;
        }
        !completedBlock ? : completedBlock(image, error, cacheType, imageURL);
    }];
}

/**
 *  加载图片
 *
 *  @param imageUrl 图片地址
 *  @param model    imageView填充模式
 */
- (void)ty_loadImageWithUrl:(NSString *)imageUrl contentModel:(UIViewContentMode)model
{
    DDLog(@"图片地址：%@",imageUrl);
    self.backgroundColor = COLOR_VIEW_BACKGROUND;
    self.contentMode = UIViewContentModeCenter;
    [self sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"mr_pic"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) { //图片加载成功选择填充模式
            self.backgroundColor = [UIColor clearColor];
            self.contentMode = model;
        }
    }];
}


- (void)ty_loadImageWithUrl:(NSString *)imageUrl placeholderImage:(NSString *)imageNamed contentModel:(UIViewContentMode)model
{
    DDLog(@"图片地址：%@",imageUrl);
    self.backgroundColor = COLOR_VIEW_BACKGROUND;
    self.contentMode = model;
    [self sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:imageNamed] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) { //图片加载成功选择填充模式
            self.backgroundColor = [UIColor clearColor];
            self.contentMode = model;
        }
    }];
}

@end
