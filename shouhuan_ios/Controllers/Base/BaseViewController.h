//
//  BaseViewController.h
//  BaseProject
//
//  Created by wujianming on 16/9/21.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNavigationBar.h"
//#import "AFNRequestManager.h"
@interface BaseViewController : UIViewController
{
    @public
    NSInteger _currentIndex;
}

/**
 * 自定义导航栏
 * 该导航栏实际上是在NAV底下的一个view，所有导航栏item的功能还是由导航栏实现
 * 自定义导航item，还是调用NavigationController的方法
 * 默认情况下，导航栏的所有item都为透明的，修改文字图片，使用该自定义navbar的API
 */
@property (strong, nonatomic) BaseNavigationBar *km_navigationBar;

/** 用于代替self.title设置控制器标题 */
@property (copy, nonatomic) NSString *km_title;

/** 设置标题title和img（当它是个按钮时） */
- (void)setKm_titleButtonTitle:(NSString *)title ImageName:(NSString *)imgName;

/** 关闭导航栏LeftItem事件及隐藏图片，同时侧滑事件也同时关闭*/
- (void)closeNavigationBarLeftItemActionAndHideItemImages;

/** 隐藏自定义导航栏*/
- (void)hideKm_navigationBar;

/** 拨打电话*/
- (void)callNumber:(NSString *)number;

- (void)refreshData;
- (void)loadMoreData;

@end
