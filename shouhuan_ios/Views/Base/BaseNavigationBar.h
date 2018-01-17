//
//  BaseNavigationBar.h
//  BaseProject
//
//  Created by wujianming on 16/10/11.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ItemActionBlock)(UIButton *item);

@interface BaseNavigationBar : UIView

@property (strong, nonatomic) UIButton *titleItem;
@property (strong, nonatomic) UIButton *leftItem;
@property (strong, nonatomic) UIButton *rightItem;
@property (strong, nonatomic) UIImage *shadowImage;

@property (strong, nonatomic) UIButton *rightssItem;

/**
 * size: 当前view的size（横屏时的size与self.view.bouns.size是有区别）
 * view: km_Navigationbar 所在父控件
 * 作用: km_Navigationbar 的适配（竖屏和横屏）
 */
- (void)sizeToFitNavigationBarWithSize:(CGSize)size inSuperView:(UIView *)view;

/**
 * 导航标题回调方法
 */
- (void)titleItemActionCompletion:(ItemActionBlock)completion;
/**
 * 导航左键回调方法
 */
- (void)leftItemActionCompletion:(ItemActionBlock)completion;
/**
 * 导航右键回调方法
 */
- (void)rightItemActionCompletion:(ItemActionBlock)completion;

@end
