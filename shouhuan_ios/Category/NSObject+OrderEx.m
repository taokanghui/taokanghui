//
//  NSObject+OrderEx.m
//  DSports
//
//  Created by wujianming on 16/12/14.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "NSObject+OrderEx.h"

@implementation NSObject (OrderEx)

- (NSString *)orderTypeString:(NSInteger)type {
    NSString *tempType = nil;
    switch (type) {
        case 0:
            tempType = @"赛事";
            break;
            
        case 1:
            tempType = @"活动";
            break;
            
        case 2:
            tempType = @"公益";
            break;
            
        case 3:
            tempType = @"培训";
            break;
            
        case 4:
            tempType = @"预约场馆";
            break;
            
        case 5:
            tempType = @"预约教练";
            break;
            
        case 6:
        case 19:
            tempType = @"充值";
            break;
            
        case 7:
            tempType = @"商品";
            break;
            
        case 8:
            tempType = @"储物柜";
            break;
            
        case 9:
            tempType = @"发票订单";
            break;
            
        case 10:
            tempType = @"课程";
            break;
        case 15:
            tempType = @"门票";
            break;
        case 16:
            tempType = @"更衣柜";
            break;
        case 17:
            tempType = @"会员卡";
            break;
        case 18:
            tempType = @"主动付";
            break;
        default:
            break;
    }
    
    if (tempType == nil) {
        tempType = @"";
    }
    
    return tempType;
}

- (NSString *)orderStateString:(NSInteger)state {
    NSString *payState = nil;
    switch (state) {
        case 0:
            payState = @"待付款";
            break;
            
        case 1:
            payState = @"支付中";
            break;
            
        case 2:
            payState = @"已付款";
            break;
            
        case 3:
            payState = @"已取消";
            break;
            
        case 4:
            payState = @"已完成";
            break;
        case 5:
            payState = @"申请退款中";
            break;
        case 6:
            payState = @"已退款";
            break;
        case 8:
            payState = @"拒绝退款";
            break;
        default:
            break;
    }
    
    if (payState == nil) {
        payState = @"";
    }
    
    return payState;
}

- (NSString *)orderPayWayString:(NSInteger)payWay {
    NSString *tempPay = nil;

    switch (payWay) {
        case 0:
            tempPay = @"免费";
            break;
            
        case 1:
            tempPay = @"支付宝";
            break;
            
        case 2:
            tempPay = @"微信";
            break;
            
        case 3:
            tempPay = @"储值卡";
            break;
            
        case 4:
            tempPay = @"现金收款";
            break;
        case 5:
            tempPay = @"货到付款";
            break;
        case 6:
            tempPay = @"线下付款";
            break;
        case 7:
            tempPay = @"后台充值";
            break;
        case 8:
            tempPay = @"转账";
            break;
        case 9:
            tempPay = @"POS";
            break;
        case 10:
            tempPay = @"备用金";
            break;
        case 11:
            tempPay = @"大生卡";
            break;
        default:
            break;
    }
    
    if (tempPay == nil) {
        tempPay = @"";
    }
    
    return tempPay;
}

@end
