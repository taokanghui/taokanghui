//
//  LYCopyLabel.m
//  CopyLabel
//
//  Created by 世界说 on 2016/9/28.
//  Copyright © 2016年 李迎. All rights reserved.
//

#import "LYCopyLabel.h"

@implementation LYCopyLabel
//同上
-(void)awakeFromNib{
    [super awakeFromNib];
    [self attachTapHandler];
}
//绑定事件
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self attachTapHandler];
    }
    return self;
}
//UILabel默认是不接收事件的，我们需要自己添加touch事件
-(void)attachTapHandler{
    self.userInteractionEnabled = YES;  //用户交互的总开关
    UILongPressGestureRecognizer *touch = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:touch];
}
//手势的触发事件
-(void)handleTap:(UILongPressGestureRecognizer*) recognizer{
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES animated:YES];
}

// default is NO
- (BOOL)canBecomeFirstResponder{
    return YES;
}
//"反馈"关心的功能
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    return (action == @selector(copy:));
}
//针对于copy的实现
-(void)copy:(id)sender{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}

@end
