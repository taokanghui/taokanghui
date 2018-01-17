//
//  BaseTabBarController.m
//  BaseProject
//
//  Created by wujianming on 16/9/21.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "SHHeartViewController.h"
#import "SHMyViewController.h"
#import "SHSleepViewController.h"
#import "SHStepViewController.h"
@interface BaseTabBarController () <UITabBarControllerDelegate>

@property (nonatomic ,strong) SHStepViewController *stepVc;

@property (nonatomic ,strong) SHHeartViewController *heartVc;

@property (nonatomic ,strong) SHSleepViewController *sleepVc;

@property (nonatomic ,strong) SHMyViewController *myVc;


@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
} 

- (void)commonInit {
    // Controllers
    
    _stepVc = [[SHStepViewController alloc] init];
    _heartVc = [[SHHeartViewController alloc] init];
    _sleepVc = [[SHSleepViewController alloc] init];
    _myVc = [[SHMyViewController alloc] init];
    NSArray *titleNameArr = @[@"步数",@"心率",@"睡眠",@"我的"];
    NSArray *imageArr = @[@"juli",@"xinlu",@"shuimian",@"person"];
    NSArray *selectImageArr = @[@"juli",@"xinlu",@"shuimian",@"person"];
    NSArray *vcArr = @[_stepVc,_heartVc,_sleepVc,_myVc];
    NSMutableArray *navArr = [NSMutableArray array];
    for (int i = 0; i < vcArr.count; i++) {
        UIViewController *subVc = vcArr[i];
        subVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titleNameArr[i] image:[[UIImage imageNamed:imageArr[i] ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]  selectedImage:[[UIImage imageNamed:selectImageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        BaseNavigationController *naVC =  [[BaseNavigationController alloc] initWithRootViewController:subVc];

        [navArr addObject:naVC];
    }
    self.viewControllers = navArr;

    UITabBarItem *item = [UITabBarItem appearance];//正常状态的文字
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:kBaseWhiteColor, NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:kBaseWhiteColor, NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateSelected];
    [self.tabBar setTintColor:kBaseWhiteColor];
    [UITabBar appearance].translucent = NO;
    [UITabBar appearance].backgroundColor = NARCOLOR;
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
    backView.userInteractionEnabled = YES;
    backView.backgroundColor = NARCOLOR;
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
    
    CGSize indesss = CGSizeMake(self.tabBar.bounds.size.width/self.tabBar.items.count, self.tabBar.bounds.size.height);
    self.tabBar.selectionIndicatorImage = [self drawTabbarBackgroundImageWithSize:indesss];
    
}

- (UIImage *)drawTabbarBackgroundImageWithSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(ctx, 18.0/255, 157.0/255, 230.0/255, 1);
    
    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
    
    
}

@end
