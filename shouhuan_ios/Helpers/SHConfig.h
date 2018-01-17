//
//  SHConfig.h
//  shouhuan_ios
//
//  Created by hulianxinMac on 2018/1/17.
//  Copyright © 2018年 hulianxinMac. All rights reserved.
//

#ifndef SHConfig_h
#define SHConfig_h

// 日志输出宏
#ifdef DEBUG
#define NSLog(something, ...) NSLog((@"- 方法名: %s - %d行 - 输出信息: {\n\t"something @"\n}"), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif

#ifdef DEBUG
#define DDLog(format, ...) printf("Class: <%s:(%d) > Log:%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define DDLog(format, ...)
#endif

//弱引用宏
#define WEAKSELF(weakSelf) __weak __typeof(&*self) weakSelf = self;

// 初始化
#define TYUserDefault  [NSUserDefaults standardUserDefaults]
#define TYNotification [NSNotificationCenter defaultCenter]

// 快捷创建
#define KEY_WINDOW       [[UIApplication sharedApplication] keyWindow]
#define ROOT_VIEW_CONTROLLER [UIApplication sharedApplication].keyWindow.rootViewController

#define kNormalSize 14
// 常用高度
#define NAVIGATION_HEIGHT (IS_IPHONE_X ? 88 : 64)
#define TABBAR_HEIGHT (IS_IPHONE_X ? (49.f+34.f) : 49.f)
#define TABBAR_HEIGHT_NORMAL 49.0f

// Tabbar safe bottom margin.
#define  TabbarSafeBottomMargin         (IS_IPHONE_X ? 34.f : 0.f)
// Status bar height.
#define  StatusBarHeight      (IS_IPHONE_X ? 44.f : 20.f)
// Navigation bar height.
#define  NavigationBarHeight  44.f
#define ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})
//设备尺寸
#define SCREEN_BOUNDS   [[UIScreen mainScreen] bounds]
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
//比例
#define SCALE_HEIGHT(height)     (height * (SCREEN_HEIGHT / 667.0))
#define SCALE_WIDTH(width)       (width * (SCREEN_WIDTH / 375.0))

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
//手机版本
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH <= 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_X (SCREEN_WIDTH == 375.0f && SCREEN_HEIGHT == 812.0f)

// 常用布局尺寸
#define SCREEN_BOUNDS_WITHOUT_NAV CGRectMake(0, NAVIGATION_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATION_HEIGHT)
#define SCREEN_BOUNDS_WITHOUT_NAV_TABBAR CGRectMake(0, NAVIGATION_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATION_HEIGHT - TABBAR_HEIGHT)

//iOS系统版本
#define iOS(versionAbove)    [[[UIDevice currentDevice] systemVersion] floatValue] >= versionAbove
#define iOSBefore(version)   [[[UIDevice currentDevice] systemVersion] floatValue] < version

//阿里云缩放 imageUrl  高度  宽度
//#define SCALEIMAGEURL(_url,_height,_width) [NSString stringWithFormat:@"%@@%ldh_%ldw_1l_0e.png",_url,(long)_height,(long)_width]
#define SCALEIMAGEURL(_url,_height,_width) [NSString stringWithFormat:@"%@?x-oss-process=image/resize,m_fixed,h_%ld,w_%ld/format,jpg",_url,(long)_height,(long)_width]
//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))

// 常用颜色
#define COLOR(colorHex)         [UIColor colorWithRGBHex:colorHex]
#define COLOR_(color)           [UIColor colorWithHexString:color]
#define COLOR_VIEW_BACKGROUND   COLOR(0xF5F5F5) // 全局背景色，淡灰
#define COLOR_NAV_BACKGROUND    COLOR(0x0b7cb7) // 全局导航色
#define NARCOLOR    COLOR(0x0b7cb7) // 全局导航色

#define kBaseWhiteColor COLOR(0xffffff)

#define COLOR_BaseGreen    COLOR(0x4ba938)   //绿色
///占位图
#define kPlaceHoldImage [UIImage imageNamed:@"mr_pic"]

// 请求数量
#define APIPageIndex 1
#define APIPageSize 40



// 颜色
#define rgb(a,b,c) [UIColor colorWithRed:(a)/255.0 green:(b)/255.0 blue:(c)/255.0 alpha:1.0]

// 随机色
#define RandomColor ZTColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

// 常用字体
#define NavFont Font(17)
#define Font(size) [UIFont systemFontOfSize:size]
#define Font_Bold(size) [UIFont boldSystemFontOfSize:size]

#define Numbers @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @":"]

// 非空判断
#define kEnsureNotNil(str) [DSTool ensureNotNiL:str]
//适配iOS11的scrollowView
#define kSuitScollowViewForIOS11(view) if (@available(iOS 11.0, *)) {\
[view setValue:@(0) forKey:@"estimatedSectionFooterHeight"];\
[view setValue:@(0) forKey:@"estimatedSectionHeaderHeight"];\
view.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;\
} else {\
self.automaticallyAdjustsScrollViewInsets = NO;\
}\

#endif /* SHConfig_h */
