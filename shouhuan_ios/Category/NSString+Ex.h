//
//  NetApiClient.m
//  TTTest
//
//  Created by xkun on 15/6/19.
//  Copyright (c) 2015年 xkun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Ex)
//生成用户标示
+ (NSString *)userAgentStr;
//MD5加密
- (NSString *)md5Str;
//sha1加密
- (NSString *)sha1Str;
//检测字符串字节大小
+ (NSString *)sizeDisplayWithByte:(CGFloat)sizeOfByte;
//去掉字符串中的空格
- (NSString *)trimWhitespace;
//转换拼音
- (NSString *)transformToPinyin;
//获取字符串自适应的size
- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
//获取字符串自适应的高
- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
//获取字符串自适应的宽
- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

/**
 *  返回字符串的SIZE
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
- (CGSize)sizeWithfont:(UIFont*)font MaxX:(CGFloat)maxx;
- (CGSize)sizeWithfont:(UIFont*)font;
- (NSInteger)Filesize;


//判断有没有表情
- (BOOL)containsEmoji;
//判断是否为空
- (BOOL)isEmpty;
//判断是否为整形
- (BOOL)isPureInt;
//判断是否为浮点形
- (BOOL)isPureFloat;
//判断电话号码
- (BOOL)checkPhoneNumInput;
// 判断是否身份证
- (BOOL)judgeIdentityStringValid;
///验证台胞证合法
+ (BOOL)isTaiwan:(NSString *)content;
///验证港澳通行证合法
+ (BOOL)isHKMacao:(NSString *)content;
///验证护照合法
+ (BOOL)isPassport:(NSString *)content;
//获取时间戳
+ (NSString *)timestamp;
//获取app版本号
+ (NSString *)getVersion;
//字符串转码成UTF-8
- (NSString *)stringToUTF8;
//字符串转码Base64
- (NSString *)stringToBase64;
// 检测字符串是否包含emoji👀表情
+ (BOOL)stringContainsEmoji:(NSString *)string;
// 检测邮箱地址是否合法
+ (BOOL)validateEmail:(NSString *)email;

// 富文本文字
+ (NSAttributedString *)attributedMakeUpStringWithFirstStr:(NSString *)str1
                                                FirstColor:(UIColor *)color1
                                                 FirstFont:(UIFont *)font1
                                              TheSecondStr:(NSString *)str2
                                               SecondColor:(UIColor *)color2
                                                SecondFont:(UIFont *)font2;

@end
