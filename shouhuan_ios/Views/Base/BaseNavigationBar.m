//
//  BaseNavigationBar.m
//  BaseProject
//
//  Created by wujianming on 16/10/11.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "BaseNavigationBar.h"

@interface BaseNavigationBar ()

@property (copy, nonatomic) ItemActionBlock titleCallBack;
@property (copy, nonatomic) ItemActionBlock leftCallBack;
@property (copy, nonatomic) ItemActionBlock rightCallBack;
@property (strong, nonatomic) UIImageView *shadowView;

@end

@implementation BaseNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = COLOR_VIEW_BACKGROUND;
        
        self.titleItem = [UIButton buttonWithType:UIButtonTypeCustom];
        self.titleItem.userInteractionEnabled = NO;
        self.titleItem.titleLabel.font = NavFont;
        self.titleItem.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.titleItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [self.titleItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [self addSubview:self.titleItem];
        
         [self.titleItem addTarget:self action:@selector(titleItemAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.leftItem = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftItem.titleLabel.font = Font(14.0);
        [self.leftItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.leftItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self.leftItem setImageEdgeInsets:(UIEdgeInsets){0, 12, 0, 0}];
        [self addSubview:self.leftItem];
        
        [self.leftItem addTarget:self action:@selector(leftItemAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightItem.titleLabel.font = Font(14.0);
        [self.rightItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.rightItem setTitleColor:COLOR_(@"999999") forState:UIControlStateHighlighted];
        [self.rightItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
//        [self.rightItem setImageEdgeInsets:(UIEdgeInsets){0, 0, 0, 12}];
//        [self.rightItem setTitleEdgeInsets:(UIEdgeInsets){0, 0, 0, 12}];
        [self addSubview:self.rightItem];
        
        [self.rightItem addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        CGFloat topHeight = (IS_IPHONE_X ? 44.0 : 20.0);

        
        self.shadowView = [[UIImageView alloc] init];
        self.shadowView.backgroundColor = COLOR(0xD1D1D1);
        [self addSubview:self.shadowView];
        
        [self.shadowView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.equalTo(@0.5);
        }];
        
        [self.leftItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.mas_equalTo(self.mas_top).offset(topHeight);
            make.width.equalTo(@70);
            make.bottom.equalTo(self);
        }];
        
        [self.rightItem setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.rightItem.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [self.rightItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.leftItem);
            make.right.mas_equalTo(self.mas_right).offset(-10);
            make.width.equalTo(@70);
        }];
        
        [self.titleItem setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.titleItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mas_right).offset(-75);
            make.left.mas_equalTo(self.mas_left).offset(75);
            make.top.mas_equalTo(self.mas_top).offset(topHeight);
            make.bottom.equalTo(self);
        }];
    }
    
    return self;
}

- (void)sizeToFitNavigationBarWithSize:(CGSize)size inSuperView:(UIView *)view {
        // 横屏约束变更参数
    
}

- (void)setShadowImage:(UIImage *)shadowImage {
    _shadowImage = shadowImage;
    _shadowView.image = _shadowImage;
    _shadowView.backgroundColor = [UIColor clearColor];
}

- (void)titleItemAction:(UIButton *)btn {
    if (_titleCallBack) {
        _titleCallBack(btn);
    }
}

- (void)leftItemAction:(UIButton *)btn {
    if (_leftCallBack) {
        _leftCallBack(btn);
    }
}

- (void)rightItemAction:(UIButton *)btn {
    if (_rightCallBack) {
        _rightCallBack(btn);
    }
}

- (void)titleItemActionCompletion:(ItemActionBlock)completion {
    _titleCallBack = completion;
    self.titleItem.userInteractionEnabled = YES;
}

- (void)leftItemActionCompletion:(ItemActionBlock)completion {
    _leftCallBack = completion;
}

- (void)rightItemActionCompletion:(ItemActionBlock)completion {
    _rightCallBack = completion;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    UIViewController *currentVc = [UIViewController currentViewController];
    [self sizeToFitNavigationBarWithSize:currentVc.view.frame.size inSuperView:currentVc.view];
    
    if (currentVc.navigationController.viewControllers.count > 1) {
        [self.leftItem setImage:[UIImage imageNamed:@"back-BLACK"] forState:UIControlStateNormal];
    }
}

- (UIViewController *)currentController {
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    
    return nil;
}

@end
