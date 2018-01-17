//
//  SHStepViewController.m
//  shouhuan_ios
//
//  Created by hulianxinMac on 2018/1/17.
//  Copyright © 2018年 hulianxinMac. All rights reserved.
//

#import "SHStepViewController.h"
#import "MJRefresh.h"
#import "XBScorePlateView.h"
#define SPRING_BACK 0.3

@interface SHStepViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView * scrollView;
@property (nonatomic,strong)UITableView  * tabView;
@property (nonatomic,assign)CGFloat   offset;

@property (nonatomic ,strong)XBScorePlateView * myview;

@property(nonatomic,strong)UIButton * selectBtn;
@end

@implementation SHStepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self hideKm_navigationBar];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    [self.view addSubview:self.scrollView];
    
    UIImageView *imagvv = [[UIImageView alloc] initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT+20)];
    imagvv.image = [UIImage imageNamed:@"tuceng4"];
    [self.scrollView addSubview:imagvv];
    
    UIImageView *imagcc = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2-TABBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT/2)];
    imagcc.image = [UIImage imageNamed:@"59f2971ad8bc2"];
    [self.scrollView addSubview:imagcc];
    
    _myview = [[XBScorePlateView alloc]initWithFrame:CGRectMake(60, 65, SCREEN_WIDTH-120, SCREEN_WIDTH-120)];
    self.view.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:_myview];
    
    for (int i = 0; i<2; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i==0?SCREEN_WIDTH-110:30, CGRectGetMaxY(_myview.frame), 80, 30)];
        btn.titleLabel.font = Font(14);
        [btn.layer setMasksToBounds:YES];
        [btn.layer setCornerRadius:15.0]; //设置矩形四个圆角半径
        //边框宽度
        [btn.layer setBorderWidth:1.0];
        btn.layer.borderColor=COLOR(0x9197a2).CGColor;
        [btn setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:COLOR(0x3bc75f)] forState:UIControlStateSelected];
        [btn setTitle:i==0?@"后一天":@"前一天" forState:UIControlStateNormal];
        [btn setTitleColor:COLOR(0x9197a2) forState:UIControlStateNormal];
        [btn setTitleColor:kBaseWhiteColor forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
    }
}

- (void)btnAction:(UIButton *)sender
{
    //sender.selected = !sender.selected;
    if (_selectBtn == nil){
        sender.selected = YES;
        _selectBtn = sender;
    }
    else  if (_selectBtn !=nil &&_selectBtn == sender){
        sender.selected = YES;
    } else if (_selectBtn!= sender && _selectBtn!=nil){
        _selectBtn.selected = NO;
        sender.selected = YES;
        _selectBtn = sender;
    }
    //_selectIndex = sender.tag;

    _myview = [[XBScorePlateView alloc]initWithFrame:CGRectMake(60, 65, SCREEN_WIDTH-120, SCREEN_WIDTH-120)];
    self.view.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:_myview];
    _myview.altitudeValues = 6.0;
}

#pragma mark - getter
-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT)];
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT+SPRING_BACK-TABBAR_HEIGHT);
        _scrollView.contentOffset = CGPointZero;
        _scrollView.delegate = self;
        _scrollView.backgroundColor = COLOR_VIEW_BACKGROUND;
    }
    return _scrollView;
}


-(UITableView *)tabView
{
    if (!_tabView) {
        _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT)];
        _tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tabView.backgroundColor = COLOR_VIEW_BACKGROUND;
        
    }
    return _tabView;
}


-(void)loadingWeb
{
    [self.tabView headerEndRefreshing];
    self.tabView.headerReleaseToRefreshText = @"松开返回上一页";
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.scrollView.contentOffset = CGPointMake(0,0);
        self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT + SPRING_BACK);
    } completion:^(BOOL finished) {
        self.scrollView.scrollEnabled = YES;
        self.tabView.scrollEnabled = NO;
    }];
    
}
#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    //[SVProgressHUD showSuccessWithStatus:@"加载成功"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //[SVProgressHUD dismiss];
    });
    
}
#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView) {
        _offset = scrollView.contentOffset.y;
    }
    
    NSLog(@"y = %f",scrollView.contentOffset.y);
    
    CGFloat offsetY = scrollView.contentOffset.y;
    if (scrollView == self.scrollView) {
        if (offsetY > 20) {
            //self.middleLab.text = @"释放返回中间View";
        }else{
            //self.middleLab.text = @"上拉显示底部View";
        }
    }
}
-(void)scrollViewWillBeginDecelerating: (UIScrollView *)scrollView{
    if (_offset > 20) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            if (_tabView == nil) {
                //[SVProgressHUD showWithStatus:@"努力加载中..."];
            }
            [self.scrollView addSubview:self.tabView];
            [self.tabView addHeaderWithTarget:self action:@selector(loadingWeb)];
            self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * 2);
            self.scrollView.contentOffset = CGPointMake(0, SCREEN_HEIGHT);
        } completion:^(BOOL finished) {
            self.scrollView.scrollEnabled = NO;
            self.tabView.scrollEnabled = YES;
        }];
        
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (_offset < 20) {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            self.scrollView.contentOffset = CGPointMake(0,0);
        } completion:^(BOOL finished) {
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
