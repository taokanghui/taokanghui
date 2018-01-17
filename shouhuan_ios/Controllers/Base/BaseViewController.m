//
//  BaseViewController.m
//  BaseProject
//
//  Created by wujianming on 16/9/21.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "BaseViewController.h"
static CGFloat const startH = 0;

#define FBStatusBarH ([UIApplication sharedApplication].statusBarFrame.size.height)
//** navigationBar的高度 */
#define FBNavigationBarH (FBStatusBarH + 44)
@interface BaseViewController ()

@property (strong, nonatomic) UIWebView *phoneManager;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self baseInit];
    NSLog(@"%@ Appear", self.class);
}

- (void)dealloc {
    NSLog(@"--->EXIT: %@ Dealloc", [self class]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private
- (void)baseInit {
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.km_navigationBar];
    [self.km_navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@(NAVIGATION_HEIGHT));
    }];
    if (self.navigationController.childViewControllers.count > 1) {
        [self.km_navigationBar.leftItem setImage:[UIImage imageNamed:@"back-WHITH"] forState:UIControlStateNormal];
    }
    
    WEAKSELF(weakSelf)
    [self.km_navigationBar leftItemActionCompletion:^(UIButton *item) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)setKm_titleButtonTitle:(NSString *)title ImageName:(NSString *)imgName
{
    
    [self.km_navigationBar.titleItem setTitle:title forState:UIControlStateNormal];
    [self.km_navigationBar.titleItem setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [self.km_navigationBar.titleItem layoutButtonWithEdgeInsetsStyle:TYButtonEdgeInsetsStyleRight imageTitleSpace:2];
}

- (void)closeNavigationBarLeftItemActionAndHideItemImages {
    self.km_navigationBar.leftItem.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc] init]];
}

- (void)hideKm_navigationBar {
    self.km_navigationBar.hidden = YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


#pragma mark - System iOS8 above
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [self.km_navigationBar sizeToFitNavigationBarWithSize:size inSuperView:self.view];
}

#pragma mark - Getter And Setter
- (BaseNavigationBar *)km_navigationBar {
    if (_km_navigationBar == nil) {
        _km_navigationBar = [[BaseNavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, FBNavigationBarH)];
        _km_navigationBar.backgroundColor = COLOR_NAV_BACKGROUND;
        _km_navigationBar.shadowImage = [UIImage imageWithColor:UIColor.clearColor];
        
    }
    
    return _km_navigationBar;
}

- (void)setKm_title:(NSString *)km_title {
    _km_title = km_title;
    [self.km_navigationBar.titleItem setTitle:_km_title forState:UIControlStateNormal];
}

- (void)refreshData{}
- (void)loadMoreData{}

- (UIWebView *)phoneManager {
    if (_phoneManager == nil) {
        _phoneManager = [[UIWebView alloc] init];
        
        [self.view addSubview:_phoneManager];
    }
    
    return _phoneManager;
}

- (void)callNumber:(NSString *)number {
    [self.phoneManager loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]]]];
}

@end
