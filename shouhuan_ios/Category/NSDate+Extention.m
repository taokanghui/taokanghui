//
//  NSDate+Extention.m
//  CustomNavTest
//
//  Created by kimeeos on 16/5/30.
//  Copyright © 2016年 kimeeos. All rights reserved.
//

#import "NSDate+Extention.h"

@implementation NSDate (Extention)

+ (NSDate *)dateFromStr:(NSString *)str withFormat:(NSString*)format {
    if (str.length <= 0) {
        return [NSDate date];
    } else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:format];
        NSDate *currentDate = [dateFormatter dateFromString:str];
        return currentDate;
    }
}

+ (NSTimeInterval)timeStampSince1970WithDefalutFormatTimeString:(NSString *)timeString {
    NSDate *date = [NSDate dateFromStr:timeString withFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [date timeIntervalSince1970];
}
+ (NSTimeInterval)timeStampSince1970WithDefalutFormatTimeString:(NSString *)timeString withFormat:(NSString*)format
{
    NSDate *date = [NSDate dateFromStr:timeString withFormat:format];
    return [date timeIntervalSince1970];
}

+ (instancetype)dateWithCurrentWeekAtFirst {
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:nowDate];
    // 获取今天是周几
    NSInteger weekDay = [comp weekday];
    // 获取几天是几号
    NSInteger day = [comp day];
    
    // 计算当前日期和本周的星期一和星期天相差天数
    long firstDiff;
    
    if (weekDay == 1)
    {
        firstDiff = -6;
    }
    else
    {
        firstDiff = [calendar firstWeekday] - weekDay + 1;
    }
    
    // 在当前日期(去掉时分秒)基础上加上差的天数
    NSDateComponents *firstDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay  fromDate:nowDate];
    [firstDayComp setDay:day + firstDiff];
    NSDate *firstDayOfWeek = [calendar dateFromComponents:firstDayComp];
    
    return firstDayOfWeek;
}

+ (NSString *)dateStringWithCurrentWeekAtFirst {
    return [[NSDate dateWithCurrentWeekAtFirst] dateWithDateFormat:@"yyyy-MM-dd"];
}

+ (instancetype)dateWithCurrentWeekAtLast {
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:nowDate];
    // 获取今天是周几
    NSInteger weekDay = [comp weekday];
    // 获取几天是几号
    NSInteger day = [comp day];
    
    // 计算当前日期和本周的星期一和星期天相差天数
    long lastDiff;
    //    weekDay = 1;
    if (weekDay == 1)
    {
        lastDiff = 0;
    }
    else
    {
        lastDiff = 8 - weekDay;
    }
    
    // 在当前日期(去掉时分秒)基础上加上差的天数
    NSDateComponents *lastDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay   fromDate:nowDate];
    [lastDayComp setDay:day + lastDiff];
    NSDate *lastDayOfWeek = [calendar dateFromComponents:lastDayComp];
    
    return lastDayOfWeek;
}

+ (NSString *)dateStringWithCurrentWeekAtLast {
    return [[NSDate dateWithCurrentWeekAtLast] dateWithDateFormat:@"yyyy-MM-dd"];
}

+ (instancetype)dateWithCurrentMonthAtFirst {
    // 获取当月第一天
    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:now];
    comps.day = 1;
    NSDate *firstDay = [cal dateFromComponents:comps];
    
    return firstDay;
}

+ (NSString *)dateStringWithCurrentMonthAtFirst {
    // 获取当月第一天
    return [[NSDate dateWithCurrentMonthAtFirst] dateWithDateFormat:@"yyyy-MM-dd"];
}

+ (instancetype)dateWithCurrentMonthAtLast {
    // 当月天数
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSUInteger numberOfDaysInMonth = range.length;
    
    // 获取当月最后一天
    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:now];
    comps.day = numberOfDaysInMonth;
    NSDate *lastDay = [cal dateFromComponents:comps];
    
    return lastDay;
}

+ (NSString *)dateStringWithCurrentMonthAtLast {
    // 获取当月第一天
    return [[NSDate dateWithCurrentMonthAtLast] dateWithDateFormat:@"yyyy-MM-dd"];
}

- (NSString *)dateWithDateFormat:(NSString *)str {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = str;
    
    NSString *dateStr = [format stringFromDate:self];
    
    return dateStr;
}

+ (NSString *)todayString {
    return [[NSDate date] dateWithDateFormat:@"yyyy-MM-dd"];
}

+ (NSString *)nowYearMonthDay
{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
}

+ (instancetype)yesterday {
    NSDate *yesterday = [NSDate dateWithTimeIntervalSinceNow:-(24*60*60)];
    
    return yesterday;
}

+ (NSString *)yesterdayString {
    return [[NSDate yesterday] dateWithDateFormat:@"yyyy-MM-dd"];
}

+ (instancetype)tomorrow {
    NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:(24*60*60)];
    
    return tomorrow;
}

+ (NSString *)tomorrowString {
    return [[NSDate tomorrow] dateWithDateFormat:@"yyyy-MM-dd"];
}

+ (instancetype)dateWithIndex:(NSInteger)index {
    NSDate *day = [NSDate dateWithTimeIntervalSinceNow:index * (24*60*60)];
    
    return day;
}

/** 正数表示往后几天，负数表示往前几天，index = 1 明天， -1 昨天 0 今天*/
- (instancetype)dateWithIndex:(NSInteger)index {
    NSDate *day = [NSDate dateWithTimeInterval:index * (24*60*60)  sinceDate:self];
    return day;

}

+ (NSString *)dateStringWithIndex:(NSInteger)index {
    return [[NSDate dateWithIndex:index] dateWithDateFormat:@"yyyy-MM-dd"];
}

+ (NSString *)getWeekWithDateFormat:(NSString *)time {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSArray *timeArr = [time componentsSeparatedByString:@"-"];
    if (timeArr.count) {
        [comps setDay:[timeArr[2] intValue]];
        [comps setMonth:[timeArr[1] intValue]];
        [comps setYear:[timeArr[0] intValue]];
    } else {
        DDLog(@"日期非法");
        return @"";
    }
   
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *_date = [gregorian dateFromComponents:comps];
    NSDateComponents *weekdayComponents =
    [gregorian components:NSWeekdayCalendarUnit fromDate:_date];
    NSInteger weekday = [weekdayComponents weekday];
    return [NSString stringWithFormat:@"周%@",@[@"日",@"一",@"二",@"三",@"四",@"五",@"六"][weekday - 1]];
}

@end
