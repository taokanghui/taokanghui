//
//  UIButton+UIButtonSetEdgeInsets.h
//  UIButtonSetEdgeInsets
//
//  Created by Qi Wang on 11/14/14.
//  Copyright (c) 2014 qiwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CenterImageAndTitle)
////系统默认图片在左，文字在右，间隔为0
//}
//break;
//
//case 1:
//{
//    //上下居中，图片在上，文字在下
//    [button1 verticalCenterImageAndTitle:10.0f];
//}
//break;
//
//case 2:
//{
//    //左右居中，文字在左，图片在右
//    [button1 horizontalCenterTitleAndImage:50.0f];
//}
//break;
//
//case 3:
//{
//    //左右居中，图片在左，文字在右
//    [button1 horizontalCenterImageAndTitle:50.0f];
//}
//break;
//
//case 4:
//{
//    //文字居中，图片在左边
//    [button1 horizontalCenterTitleAndImageLeft:50.0f];
//}
//break;
//
//case 5:
//{
//    //文字居中，图片在右边
//    [button1 horizontalCenterTitleAndImageRight:10.0f];

//上下居中，图片在上，文字在下
- (void)verticalCenterImageAndTitle:(CGFloat)spacing;
- (void)verticalCenterImageAndTitle; //默认6.0

//左右居中，文字在左，图片在右
- (void)horizontalCenterTitleAndImage:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImage; //默认6.0

//左右居中，图片在左，文字在右
- (void)horizontalCenterImageAndTitle:(CGFloat)spacing;
- (void)horizontalCenterImageAndTitle; //默认6.0

//文字居中，图片在左边
- (void)horizontalCenterTitleAndImageLeft:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImageLeft; //默认6.0

//文字居中，图片在右边
- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImageRight; //默认6.0

@end
