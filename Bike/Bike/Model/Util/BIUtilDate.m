//
//  BIUtilDate.m
//  Bike
//
//  Created by Yuki on 4/11/15.
//  Copyright (c) 2015 kyu. All rights reserved.
//
//  日期工具类

#import "BIUtilDate.h"
#import "BILog.h"

#define kCtripCalendarTimeZone_CN   @"Asia/Shanghai"
#define kCtripCalendarTimeZone_GMT  @"GMT"

/**
 * 星期数组
 */
//static NSString[] WEEKNAME_CHINESE = new String[] { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
//static NSMutableArray *WEEKNAME_CHINESE = [NSMutableArray arrayWithObjects:@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
/**
 * ********************SIMPLEFORMATTYPE对应的字串*********************
 */
/**
 * SIMPLEFORMATTYPE1 对应类型：yyyyMMddHHmmss
 */
static NSString *SIMPLEFORMATTYPESTRING1 = @"yyyyMMddHHmmss";

/**
 * SIMPLEFORMATTYPE2 对应的类型：yyyy-MM-dd HH:mm:ss
 */
static NSString *SIMPLEFORMATTYPESTRING2 = @"yyyy-MM-dd HH:mm:ss";

/**
 * SIMPLEFORMATTYPE3 对应的类型：yyyy-M-d HH:mm:ss
 */
static NSString *SIMPLEFORMATTYPESTRING3 = @"yyyy-M-d HH:mm:ss";

/**
 * SIMPLEFORMATTYPE4对应的类型：yyyy-MM-dd HH:mm
 */
static NSString *SIMPLEFORMATTYPESTRING4 = @"yyyy-MM-dd HH:mm";

/**
 * SIMPLEFORMATTYPE5 对应的类型：yyyy-M-d HH:mm
 */
static NSString *SIMPLEFORMATTYPESTRING5 = @"yyyy-M-d HH:mm";

/**
 * SIMPLEFORMATTYPE6对应的类型：yyyyMMdd
 */
static NSString *SIMPLEFORMATTYPESTRING6 = @"yyyyMMdd";

/**
 * SIMPLEFORMATTYPE7对应的类型：yyyy-MM-dd
 */
static NSString *SIMPLEFORMATTYPESTRING7 = @"yyyy-MM-dd";

/**
 * SIMPLEFORMATTYPE8对应的类型： yyyy-M-d
 */
static NSString *SIMPLEFORMATTYPESTRING8 = @"yyyy-M-d";

/**
 * SIMPLEFORMATTYPE9对应的类型：yyyy年MM月dd日
 */
static NSString *SIMPLEFORMATTYPESTRING9 = @"yyyy年MM月dd日";

/**
 * SIMPLEFORMATTYPE10对应的类型：yyyy年M月d日
 */
static NSString *SIMPLEFORMATTYPESTRING10 = @"yyyy年M月d日";

/**
 * SIMPLEFORMATTYPE11对应的类型：M月d日
 */
static NSString *SIMPLEFORMATTYPESTRING11 = @"M月d日";

/**
 * SIMPLEFORMATTYPE12对应的类型：HH:mm:ss
 */
static NSString *SIMPLEFORMATTYPESTRING12 = @"HH:mm:ss";

/**
 * SIMPLEFORMATTYPE13对应的类型：HH:mm
 */
static NSString *SIMPLEFORMATTYPESTRING13 = @"HH:mm";
/**
 * SIMPLEFORMATTYPE7对应的类型：yyyy-MM-dd
 */
static NSString *SIMPLEFORMATTYPESTRING14 = @"yyyy/MM/dd";

/***
* SIMPLEFORMATTYPE15对应的类型：yyyy年MM月
*/

static NSString *SIMPLEFORMATTYPESTRING15 = @"yyyy年MM月";

/***
 * SIMPLEFORMATTYPE16对应的类型：yyyyMMddHHmmssSSS
 */

static NSString *SIMPLEFORMATTYPESTRING16 = @"yyyyMMddHHmmssSSS";

/***
 * SIMPLEFORMATTYPE17对应的类型：yyyy-MM-dd HH:mm:ss.SSS
 */

static NSString *SIMPLEFORMATTYPESTRING17 = @"yyyy-MM-dd HH:mm:ss.SSS";

/**
 * SIMPLEFORMATTYPESTRING18 对应类型：yyyy/MM/dd HH:mm:ss
 */
static NSString *SIMPLEFORMATTYPESTRING18 = @"yyyy/MM/dd HH:mm:ss";

static long lunarInfo[] = { 0x04bd8, 0x04ae0, 0x0a570, 0x054d5, 0x0d260, 0x0d950, 0x16554, 0x056a0, 0x09ad0, 0x055d2, 0x04ae0, 0x0a5b6, 0x0a4d0, 0x0d250, 0x1d255, 0x0b540, 0x0d6a0, 0x0ada2, 0x095b0, 0x14977, 0x04970, 0x0a4b0, 0x0b4b5, 0x06a50, 0x06d40, 0x1ab54, 0x02b60, 0x09570, 0x052f2, 0x04970, 0x06566, 0x0d4a0, 0x0ea50, 0x06e95, 0x05ad0, 0x02b60, 0x186e3, 0x092e0, 0x1c8d7, 0x0c950, 0x0d4a0, 0x1d8a6, 0x0b550, 0x056a0, 0x1a5b4, 0x025d0, 0x092d0, 0x0d2b2, 0x0a950, 0x0b557, 0x06ca0, 0x0b550, 0x15355, 0x04da0, 0x0a5d0, 0x14573, 0x052d0, 0x0a9a8, 0x0e950, 0x06aa0, 0x0aea6, 0x0ab50, 0x04b60, 0x0aae4, 0x0a570, 0x05260, 0x0f263, 0x0d950, 0x05b57, 0x056a0, 0x096d0, 0x04dd5, 0x04ad0, 0x0a4d0, 0x0d4d4, 0x0d250, 0x0d558, 0x0b540, 0x0b5a0, 0x195a6, 0x095b0, 0x049b0, 0x0a974, 0x0a4b0, 0x0b27a, 0x06a50, 0x06d40, 0x0af46, 0x0ab60, 0x09570, 0x04af5, 0x04970, 0x064b0, 0x074a3, 0x0ea50, 0x06b58, 0x055c0, 0x0ab60, 0x096d5, 0x092e0, 0x0c960, 0x0d954, 0x0d4a0, 0x0da50, 0x07552, 0x056a0, 0x0abb7, 0x025d0, 0x092d0, 0x0cab5, 0x0a950, 0x0b4a0, 0x0baa4, 0x0ad50, 0x055d9, 0x04ba0, 0x0a5b0, 0x15176, 0x052b0, 0x0a930, 0x07954, 0x06aa0, 0x0ad50, 0x05b52, 0x04b60, 0x0a6e6, 0x0a4e0, 0x0d260, 0x0ea65, 0x0d530, 0x05aa0, 0x076a3, 0x096d0, 0x04bd7, 0x04ad0, 0x0a4d0, 0x1d0b6, 0x0d250, 0x0d520, 0x0dd45, 0x0b5a0, 0x056d0, 0x055b2, 0x049b0, 0x0a577, 0x0a4b0, 0x0aa50, 0x1b255, 0x06d20, 0x0ada0 };

@implementation BIUtilDate

+ (NSString *)storageTimeZone
{
    return kCtripCalendarTimeZone_GMT;
}

+ (NSString *)displayTimeZone
{
    return kCtripCalendarTimeZone_CN;
}

+ (NSString *)SIMPLEFORMATTYPESTRING1;
{
    return SIMPLEFORMATTYPESTRING1;
}

+ (NSString *)SIMPLEFORMATTYPESTRING2;
{
    return SIMPLEFORMATTYPESTRING2;
}

+ (NSString *)SIMPLEFORMATTYPESTRING3;
{
    return SIMPLEFORMATTYPESTRING2;
}

+ (NSString *)SIMPLEFORMATTYPESTRING4;
{
    return SIMPLEFORMATTYPESTRING4;
}

+ (NSString *)SIMPLEFORMATTYPESTRING5;
{
    return SIMPLEFORMATTYPESTRING5;
}

+ (NSString *)SIMPLEFORMATTYPESTRING6;
{
    return SIMPLEFORMATTYPESTRING6;
}

+ (NSString *)SIMPLEFORMATTYPESTRING7;
{
    return SIMPLEFORMATTYPESTRING7;
}

+ (NSString *)SIMPLEFORMATTYPESTRING8;
{
    return SIMPLEFORMATTYPESTRING8;
}

+ (NSString *)SIMPLEFORMATTYPESTRING9;
{
    return SIMPLEFORMATTYPESTRING9;
}
+ (NSString *)SIMPLEFORMATTYPESTRING10;
{
    return SIMPLEFORMATTYPESTRING10;
}
+ (NSString *)SIMPLEFORMATTYPESTRING11;
{
    return SIMPLEFORMATTYPESTRING11;
}
+ (NSString *)SIMPLEFORMATTYPESTRING12;
{
    return SIMPLEFORMATTYPESTRING12;
}

+ (NSString *)SIMPLEFORMATTYPESTRING13;
{
    return SIMPLEFORMATTYPESTRING13;
}

+ (NSString *)SIMPLEFORMATTYPESTRING14
{
    return SIMPLEFORMATTYPESTRING14;
}

#pragma mark - ----------获取当前日期信息----------
#pragma mark 获取当前日期 yyyyMMddHHmmss 14位
+ (NSString *)getCurrentTime
{
    NSDate *date = [NSDate date];
    return [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE1];
}


#pragma mark 获取当前日期 yyyyMMddHHmmssSSS 17位
+ (NSString *)getCurrentTimeMillisecond
{
    NSDate *date = [NSDate date];
    return [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE16];
}


#pragma mark 获取当前日期时间 网络通信日志调用 yyyy-MM-dd HH:mm:ss.SSS
+ (NSString *)getCurrentTimeForCommLog
{
    NSDate *date = [NSDate date];
    return [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE17];
}


#pragma mark 获取当前日期 8位
+ (NSString *)getCurrentDate
{
    NSDate *date = [NSDate date];
    return [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE6];
}



#pragma mark 获取当前日历
+ (NSCalendar *)getCurrentCalendar
{
    NSCalendar *calendar_ = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar_ setFirstWeekday:1];
    [calendar_ setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [calendar_ setMinimumDaysInFirstWeek:1];
    [calendar_ setTimeZone:[NSTimeZone timeZoneWithName:[BIUtilDate displayTimeZone]]];
    
    return calendar_;
}


#pragma mark 获取当前时间的毫秒数
+ (long)getCurrentLongDate
{
    NSDate *date = [NSDate date];
    
    return [date timeIntervalSince1970] * 1000;
}






#pragma mark 将日期字串转为日期对象,dateStr需超过8位且不能为空,否则返回nil
+ (NSDate *)getDateByDateStr:(NSString *)dateStr
{
    if(dateStr == nil || dateStr.length < 8)
    {
        return nil;
    }
    
    NSDate *date = nil;
    
    if(dateStr.length == 8)
    {
        date = [BIUtilDate dateFromString:dateStr formate:@"yyyyMMdd"];
    }else if(dateStr.length == 10)
    {
        date = [BIUtilDate dateFromString:dateStr formate:@"yyyyMMddHH"];
    }else if(dateStr.length == 12)
    {
        date = [BIUtilDate dateFromString:dateStr formate:@"yyyyMMddHHmm"];
    }else if(dateStr.length == 14)
    {
        date = [BIUtilDate dateFromString:dateStr formate:@"yyyyMMddHHmmss"];
    }
    
    return date;
}


#pragma mark 将时间字串转为日期对象，dateStr小于8时返回null，不足14位补0
+ (NSDate *)getDateByDateTimeStr:(NSString *)dateStr
{
    if(dateStr == nil || dateStr.length < 8)
    {
        return [NSDate date];
    }
    
    while (dateStr.length < 14)
    {
        dateStr = [NSString stringWithFormat:@"%@0",dateStr];
    }
    
     NSDate *date = [BIUtilDate dateFromString:dateStr formate:@"yyyyMMddHHmmss"];
    
    return date;
}


#pragma mark 当前日期前一天 yyyyMMdd
+ (NSString *)getLastDate
{
    NSDate *date =[NSDate date];
    date = [[NSDate alloc] initWithTimeInterval:-86400 sinceDate:date];

    NSString *dateStr = [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE6];

    return dateStr;
}


#pragma mark 当前日期后一天 yyyyMMdd
+ (NSString *)getNextDate
{
    NSDate *date = [NSDate date];
//    date = [[[NSDate alloc] initWithTimeInterval:86400 sinceDate:date] autorelease];
    date = [BIUtilDate calculateDate:date field:DAY amount:1];
    NSString *dateStr = [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE6];
    
    return dateStr;
}

/**
 给定日期后一天 yyyyMMdd
 
 @return 日期字符串
 */
+ (NSString *)getNextDate : (NSDate *) date
{
    date = [BIUtilDate calculateDate:date field:DAY amount:1];
    NSString *dateStr = [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE6];
    
    return dateStr;
}



#pragma mark 当前日期后两天 yyyyMMdd
+ (NSString *)getAfterNextDate
{
    NSDate *date = [NSDate date];
    date = [[NSDate alloc] initWithTimeInterval:86400*2 sinceDate:date];
//    date = [[[NSDate alloc] initWithTimeInterval:86400 sinceDate:date] autorelease];
    NSString *dateStr = [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE6];
    
    return dateStr;
}

#pragma mark 获取当前日期后3天 yyyyMMdd
+ (NSString *)getThreeDayAfterDate
{
    NSDate *date = [NSDate date];
    date = [[NSDate alloc] initWithTimeInterval:86400*3 sinceDate:date];
    //    date = [[[NSDate alloc] initWithTimeInterval:86400 sinceDate:date] autorelease];
    NSString *dateStr = [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE6];
    
    return dateStr;
}

#pragma mark 根据日期返回对应的星期，如果date为nil则返回空字串
+ (NSString *)getShowWeekByDate:(NSDate *)date
{
    NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;

    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    
    NSString *dateStr = @"";
    
    switch (week) 
    {
        case 1:
            dateStr = @"星期日";
            break;
        case 2:
            dateStr = @"星期一";
            break;
        case 3:
            dateStr = @"星期二";
            break;
        case 4:
            dateStr = @"星期三";
            break;
        case 5:
            dateStr = @"星期四";
            break;
        case 6:
            dateStr = @"星期五";
            break;
        case 7:
            dateStr = @"星期六";
            break;
        default:
            break;
    }

    return dateStr;
}


#pragma mark 星期几数字索引. 从周日开始，如果date是nil，返回-1
+ (NSInteger)getWeek:(NSDate *)date
{
    NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    
    return week;
}


#pragma mark 返回，今天/明天/后天
+ (NSString *)getThreeDayDes:(NSInteger)count
{
    NSString *dateStr = @"";

    if(count >= 0 && count <= 2)
    {
        if(count == 0)
        {
            dateStr = @"今天";
        }else if(count == 1)
        {
            dateStr = @"明天";
        }else if(count == 2)
        {
            dateStr = @"后天";
        }
    }
    
    return dateStr;
}


#pragma mark - -----获取年月日时分秒-----
#pragma mark 获取日期对应的年
+ (NSInteger)getYear:(NSDate *)date
{
    if(date == nil)
    {
        return 0;
    }
    
    NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger year= [comps year];
    
    return year;      
}


#pragma mark 获取日期对应的月份
+ (NSInteger)getMonth:(NSDate *)date
{
    if(date == nil)
    {
        return 0;
    }
    
    NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger month = [comps month];
    
    return month;    
}

#pragma mark 获取日期对应的DAY
+ (NSInteger)getDay:(NSDate *)date
{
    if(date == nil)
    {
        return 0;
    }
    
    NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger day = [comps day];
    
    return day;
}


#pragma mark 获取日期所在月对应的天数
+ (NSInteger)getDaysOfMonth:(NSDate *)date
{
    if(date == nil)
    {
        return 0;
    }
    
    NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
    
    NSInteger dayCount = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date].length;
    
    return dayCount;
}


#pragma mark 获取日期对象对应的小时
+ (NSInteger)getHourOfDay:(NSDate *)date
{
    if(date == nil)
    {
        return 0;
    }
    
    NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    
    NSInteger hour = [comps hour];
    
    return hour;
}


#pragma mark 获取日起对象对应的分钟
+ (NSInteger)getMinute:(NSDate *)date
{
    if(date == nil)
    {
        return 0;
    }
    
    NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger minute = [comps minute];
    
    return minute;
}

#pragma mark 获取date对应的秒
+ (NSInteger)getSecond:(NSDate *)date
{
    if(date == nil)
    {
        return 0;
    }
    
    NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger second = [comps second];
    
    return second;
}

#pragma mark - ----------日期加减运算----------
#pragma mark 计算日期字串 DAY字段
+ (NSString *)getDateByStep:(NSString *)dateStr step:(int)step
{
    NSString *date = @"";

    if(dateStr != nil && dateStr.length >=8)
    {
        if(step == 0)
        {
            date = dateStr;
        }else 
        {
            while (dateStr.length < 14)
            {
                dateStr = [NSString stringWithFormat:@"%@0",dateStr];
            }
            
            date = [BIUtilDate getTimeByStep:dateStr field:DAY step:step];
        }
    }
    
    return date;
}


#pragma mark 对14位的日期对应的字段进行加减计算 并返回yyyyMMddHHmmss
+ (NSString *)getTimeByStep:(NSString *)dateStr field:(int)field step:(int)step
{
    if(dateStr == nil || dateStr.length == 0)
    {
        return @"";
    }
    
    NSDate *date = [BIUtilDate dateFromString:dateStr formate:SIMPLEFORMATTYPESTRING1];
    
    date = [BIUtilDate calculateCalendar:date field:field amount:step];
    
    NSString *datStr = [BIUtilDate dateFormateWithDate:date formate:SIMPLEFORMATTYPESTRING1];
    
    return datStr;
}



#pragma mark 日期加减
+ (NSDate *)calculateCalendar:(NSDate *)date field:(int)field amount:(int)amount
{
    if (date == nil) 
    {
        return nil;
    }

    return [BIUtilDate calculateDate:date field:field amount:amount];
}

#pragma mark - ----------日期和字符串互相转换----------

#pragma mark dateStr小于8时返回null，不足14位补0 将dateStr 转换成 SimpleDateFormatType对应格式的字串
+ (NSString *)calendarStrBySimpleDateFormat:(NSString *)dateStr simpleDateFormatType:(int)simpleDateFormatType
{
    if(dateStr == nil || dateStr.length < 8)
    {
        return nil;
    }
    
    while (dateStr.length < 14)
    {
        dateStr = [NSString stringWithFormat:@"%@0",dateStr];
    }
    
    NSDate *date = [BIUtilDate getDateByDateTimeStr:dateStr];
    
    NSString *dateStr1 = [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:simpleDateFormatType];
    
    return dateStr1;
}


#pragma mark 根据 SimpleDateFormatType类型将calendar转成对应的格式 如果date为null则返回空字符串
+ (NSString *)getCalendarStrBySimpleDateFormat:(NSDate *)date simpleDateFormatType:(NSInteger)SimpleDateFormatType
{
    NSString *str = @"";
    NSString *type = @"";
    switch (SimpleDateFormatType) 
    {
		case SIMPLEFORMATTYPE1:
			type = SIMPLEFORMATTYPESTRING1;
			break;
		case SIMPLEFORMATTYPE2:
			type = SIMPLEFORMATTYPESTRING2;
			break;
		case SIMPLEFORMATTYPE3:
			type = SIMPLEFORMATTYPESTRING3;
			break;
		case SIMPLEFORMATTYPE4:
			type = SIMPLEFORMATTYPESTRING4;
			break;
		case SIMPLEFORMATTYPE5:
			type = SIMPLEFORMATTYPESTRING5;
			break;
		case SIMPLEFORMATTYPE6:
			type = SIMPLEFORMATTYPESTRING6;
			break;
		case SIMPLEFORMATTYPE7:
			type = SIMPLEFORMATTYPESTRING7;
			break;
		case SIMPLEFORMATTYPE8:
			type = SIMPLEFORMATTYPESTRING8;
			break;
		case SIMPLEFORMATTYPE9:
			type = SIMPLEFORMATTYPESTRING9;
			break;
		case SIMPLEFORMATTYPE10:
			type = SIMPLEFORMATTYPESTRING10;
			break;
		case SIMPLEFORMATTYPE11:
			type = SIMPLEFORMATTYPESTRING11;
			break;
		case SIMPLEFORMATTYPE12:
			type = SIMPLEFORMATTYPESTRING12;
			break;
		case SIMPLEFORMATTYPE13:
			type = SIMPLEFORMATTYPESTRING13;
			break;
		case SIMPLEFORMATTYPE14:
			type = SIMPLEFORMATTYPESTRING14;
            break;
        case SIMPLEFORMATTYPE15:
			type = SIMPLEFORMATTYPESTRING15;
            break;
        case SIMPLEFORMATTYPE16:
			type = SIMPLEFORMATTYPESTRING16;
            break;
        case SIMPLEFORMATTYPE17:
			type = SIMPLEFORMATTYPESTRING17;
            break;
        case SIMPLEFORMATTYPE18:
			type = SIMPLEFORMATTYPESTRING18;
            break;
		default:
			type = SIMPLEFORMATTYPESTRING1;
			break;
    }
    
    
    if (type != nil && type.length != 0 && date != nil) 
    {
//        if(dateFormater == nil)
//        {
        NSDateFormatter *dateFormater = [BIUtilDate getCurrentDateFormatter];
//        }
        
        [dateFormater setDateFormat:type];
        str = [dateFormater stringFromDate:date];
        
//        [dateFormaterLock unlock];
    }
    
    return str;
}


#pragma mark 根据 NSDate转换成字符格式
+ (NSString *)stringOfDate:(NSDate *)date dateFormat:(NSString *)dateFormat
{
//    if(dateFormater == nil)
//    {
    NSDateFormatter *dateFormater = [BIUtilDate getCurrentDateFormatter];
//    }
    
    [dateFormater setDateFormat:dateFormat];
    NSString *retStr = [dateFormater stringFromDate:date];
//    [dateFormat release]; //old
     //yubo

//    return [dateFormater stringFromDate:date];
    return retStr;
}


#pragma mark 根据格式把字符串转换成日期
+ (NSDate *)dateOfString:(NSString *)dateString dateFormat:(NSString *)dateFormat
{
    if (dateString.length!=dateFormat.length) return nil ;

    NSDateFormatter *dateFormater = [BIUtilDate getCurrentDateFormatter];
    
    [dateFormater setDateFormat:dateFormat];
    NSDate *retDate = [dateFormater dateFromString:dateString];
    
    if (!retDate) {
        NSTimeZone *displayTimeZone = [NSTimeZone timeZoneWithName:[BIUtilDate displayTimeZone]];
        NSTimeZone *storageTimeZone = [NSTimeZone timeZoneWithName:[BIUtilDate storageTimeZone]];
        
        [dateFormater setTimeZone:storageTimeZone];
        retDate = [dateFormater dateFromString:dateString];
        NSInteger intervalSeconds = [displayTimeZone secondsFromGMT];
        retDate = [retDate dateByAddingTimeInterval:-intervalSeconds];
    }
    

    return retDate;
}


#pragma mark 将yyyyMMdd字符串转成yyyy年M月d日 星期x格式，如果dateStr为空则返回“”
+ (NSString *)getShowWeekByDateString:(NSString *)dateStr
{
    if(dateStr == nil || dateStr.length == 0)
    {
        return @"";
    }
    
    NSDate *date = [BIUtilDate getDateByDateTimeStr:dateStr];

    NSString *dateStr1 = [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE10];

    NSString *weekStr = [BIUtilDate getShowWeekByDate:date];
    

    NSString *dateString = [NSString stringWithFormat:@"%@  %@",dateStr1,weekStr];
    
    return dateString;
}


#pragma mark 若日期为今明后天，将yyyyMMdd字符串转成"今天/明天/后天/" 否者，转换成"星期*" 计算datestr与当前日期相差几天 dDay在3天内则返回相应的今天/明天/后天，否则返回星期*
+ (NSString *)getShowWeek:(NSString *)dateStr
{
    if(dateStr == nil)
    {
        return @"";
    }
    
    NSDate *startDate = [BIUtilDate dateFromString:dateStr formate:SIMPLEFORMATTYPESTRING6];

    NSDate *nowDate  = [NSDate date];
    NSInteger diffDay = [BIUtilDate compareDaysFromStartDate:startDate endDate:nowDate];
  
    // 三天之内，返回今天明天 后天
    NSString *retStr = @"";
    
    if(diffDay >= 0 && diffDay <= 2){
        retStr = [BIUtilDate getThreeDayDes:diffDay];
    }else {
        retStr = [BIUtilDate getShowWeekByDate1:startDate];
    }
    
    return retStr;
}
#pragma mark 若日期为今明后天，将yyyyMMdd字符串转成"前天/昨天/今天/明天/后天" 否者，转换成"星期*"
+ (NSString *)getAllShowWeek:(NSDate *)date
{
    if (!date) {
        return @"";
    }
    
    NSDate *nowDate = [NSDate date];
    NSInteger diffDay = [BIUtilDate compareDaysWithStartDate:nowDate endDate:date];
    
    NSString *retStr = @"";
    if (diffDay >= -2 && diffDay <= 2) {
        switch (diffDay) {
            case -2:
            {
                retStr = @"前天";
            }
                break;
            case -1:
            {
                retStr = @"昨天";
            }
                break;
            case 0:
            {
                retStr = @"今天";
            }
                break;
            case 1:
            {
                retStr = @"明天";
            }
                break;
            case 2:
            {
                retStr = @"后天";
            }
                break;
                
            default:
                break;
        }
    }
    else
    {
        retStr = [BIUtilDate getShowWeekByDate1:date];
    }
    
    return retStr;
}


#pragma mark 若日期为今明后天，将yyyyMMdd字符串转成"今天/明天/后天/" 否者，转换成"星期*" 计算datestr与当前日期相差几天 dDay在3天内则返回相应的今天/明天/后天，否则返回星期*
+ (NSString *)getShowWeekStringWithDateStr:(NSString *)dateStr
{
    if(dateStr == nil){
        return @"";
    }
    
    NSDate *startDate = [BIUtilDate dateFromString:dateStr formate:SIMPLEFORMATTYPESTRING6];
    
    NSDate *nowDate  = [NSDate date];
    NSInteger diffDay = [BIUtilDate compareDaysWithStartDate:nowDate endDate:startDate];
    
    // 三天之内，返回今天明天 后天
    NSString *retStr = @"";
    
    if(diffDay >= 0 && diffDay <= 2){
        retStr = [BIUtilDate getThreeDayDes:diffDay];
    }else {
        retStr = [BIUtilDate getShowWeekByDate1:startDate];
    }
    
    return retStr;
}


#pragma mark 若日期为今明后天，将yyyyMMdd字符串转成"今天/明天/后天/"否则返回空字符串
+ (NSString *)getDateStrCompareToDay:(NSString *)dateStr
{
    if(dateStr == nil || dateStr.length != 8 ){
        return @"";
    }
    
    NSString *today = @"";
    NSString *nowStr = [BIUtilDate getCurrentDate];
    NSDate *nowDate = [BIUtilDate dateFromString:nowStr formate:@"yyyyMMdd"];
    NSDate *date = [BIUtilDate dateFromString:dateStr formate:@"yyyyMMdd"];
    
    NSInteger diffDay = [BIUtilDate compareDaysFromStartDate:nowDate endDate:date];

//    // 三天之内，返回今天明天 后天 之外 返回 @""
    if(diffDay >= 0 && diffDay <= 2){
        today = [BIUtilDate getThreeDayDes:diffDay];
    }
    
    return today;
}


#pragma mark 若日期为今明后天，将yyyyMMdd字符串转成"今天/明天/后天/"否则返回空字符串
+ (NSString *)getDateStrCompareWithToday:(NSString *)dateStr
{
  if(dateStr == nil || dateStr.length != 8 ){
    return @"";
  }
  
  NSString *today = @"";
  NSString *nowStr = [BIUtilDate getCurrentDate];
  NSDate *nowDate = [BIUtilDate dateFromString:nowStr formate:@"yyyyMMdd"];
  NSDate *date = [BIUtilDate dateFromString:dateStr formate:@"yyyyMMdd"];
  
  NSInteger diffDay = [BIUtilDate compareDaysWithStartDate:nowDate endDate:date];
  
  // 三天之内，返回今天明天 后天 之外 返回 @""
  if(diffDay >= 0 && diffDay <= 2){
    today = [BIUtilDate getThreeDayDes:diffDay];
  }
  
  return today;
}






#pragma mark 将yyyyMMdd字符串转成yyyy-MM-dd 星期x格式
+ (NSString *)getShowWeekByDate2:(NSString *)dateStr
{
    if(dateStr == nil){
        return  nil;
    }
    
    NSDate *date = [BIUtilDate dateFromString:dateStr formate:SIMPLEFORMATTYPESTRING6];
    
    NSString *str = [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE7];
    
    NSString *weekStr = [BIUtilDate getShowWeek:dateStr];
    
    NSString *retStr = [NSString stringWithFormat:@"%@ %@",str,weekStr];

    return retStr;
}



#pragma mark 将yyyyMMdd字符串转成 星期几 或者 节假日
+ (NSString *) getShowHolidayOrWeekStr:(NSString *)dateStr
{
    NSString *holidayStr = [BIUtilDate getHolidayString:dateStr];

    NSString *retStr = @"";

    if(holidayStr == nil || [holidayStr isEqualToString:@""])
    {
        NSDate *date = [BIUtilDate getDateByDateTimeStr:dateStr];
        
        retStr = [BIUtilDate getShowWeekByDate:date];
    }else
    {
        retStr = holidayStr;
    }
    
    return retStr;
}

#pragma mark 将yyyyMMdd字符串转成yyyy-MM-dd
+ (NSString *)getShowWeekByDate5:(NSString *)dateStr
{
    NSDate *date = [BIUtilDate dateFromString:dateStr formate:SIMPLEFORMATTYPESTRING6];
    
    NSString *str = [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE7];
    
    return str;
}

#pragma mark 将yyyyMMddHHmmss字符串转成yyyy-MM-dd
+ (NSString *)getShowWeekByDate8:(NSString *)dateStr{
    NSDate *date = [BIUtilDate dateFromString:dateStr formate:SIMPLEFORMATTYPESTRING1];
    
    NSString *str = [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE7];
    
    return str;
}


#pragma mark 将yyyyMMdd字符串转成yyyy-MM-dd 今天/明天/后天/星期x格式
+ (NSString *)getShowWeekByDate3:(NSString *)dateStr
{
    NSDate *startDate = [BIUtilDate dateFromString:dateStr formate:SIMPLEFORMATTYPESTRING6];
    NSDate *nowDate  = [NSDate date];
    
    
    NSString *nowDateStr = [BIUtilDate dateFormateWithDate:nowDate formate:@"yyyyMMdd"];
    int diffDay = [dateStr intValue] - [nowDateStr intValue];
    
    // 三天之内，返回今天明天 后天 之外 返回 @""
    NSString *today = @"";
    
    if(diffDay >= 0 && diffDay <= 2)
    {
        today = [BIUtilDate getThreeDayDes:diffDay];
    }

    NSString *str = [BIUtilDate getCalendarStrBySimpleDateFormat:startDate simpleDateFormatType:SIMPLEFORMATTYPE7];
    
    
    NSString *retStr = @"";
    
    if(today != nil && today.length != 0)
    {
        retStr = [NSString stringWithFormat:@"%@ %@",str,today];
    }else 
    {
        
        NSString *weekStr = [BIUtilDate getShowWeek:dateStr];
        
        retStr = [NSString stringWithFormat:@"%@ %@",str,weekStr];
    }
    
    return retStr;
}


#pragma mark 将yyyyMMdd字符串转成"yyyy-MM-dd [今天/明天/后天]"+"-"+"星期*"+"-"+"节日"
+ (NSString *)getShowWeekByDate4:(NSString *)dateStr
{
    NSDate *date = [BIUtilDate dateFromString:dateStr formate:SIMPLEFORMATTYPESTRING6];
    
    NSString *holiday = [BIUtilDate getHolidayString:dateStr];
    NSString *weekday = [BIUtilDate getShowWeekByDate:date];
    NSString *today = [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE7];
    NSString *todayStr = [BIUtilDate getDateStrCompareToDay:dateStr];
    
    NSString *retStr = @"";
    
    if(holiday == nil || holiday.length == 0)
    {
        retStr = [NSString stringWithFormat:@"%@ %@-%@",today,todayStr,weekday];    
    }else 
    {
        retStr = [NSString stringWithFormat:@"%@ %@-%@-%@",today,todayStr,weekday,holiday];
    }

    return retStr;
}


#pragma mark 将yyyyMMdd字符串转成yyyy年 今天/明天/后天/星期x/节假日 格式
+ (NSString *)getShowWeekByDate6:(NSString *)dateStr
{
    NSDate *startDate = [BIUtilDate dateFromString:dateStr formate:SIMPLEFORMATTYPESTRING6];
//    NSDate *nowDate  = [NSDate date];
//    NSString *nowDateStr = [BIUtilDate dateFormateWithDate:nowDate formate:@"yyyyMMdd"];
    
    NSString *holidayStr = [BIUtilDate getHolidayString:dateStr];
    
    NSString *retStr = @"";
    
    if(holidayStr != nil && ![holidayStr isEqualToString:@""])
    {
        NSString *str = [BIUtilDate stringOfDate:startDate dateFormat:@"yyyy年"];
//        NSString *weekStr = [BIUtilDate getShowWeek:dateStr];
        retStr = [NSString stringWithFormat:@"%@ %@",str,holidayStr];

        
//        int diffDay = [dateStr intValue] - [nowDateStr intValue];
//        // 三天之内，返回今天明天 后天 之外 返回 @""
//        NSString *today = @"";
//        
//        if(diffDay >= 0 && diffDay <= 2)
//        {
//            today = [BIUtilDate getThreeDayDes:diffDay];
//        }
        
//        NSString *str = [BIUtilDate getCalendarStrBySimpleDateFormat:startDate simpleDateFormatType:SIMPLEFORMATTYPE7];
//        NSString *retStr = @"";
        
//        if(today != nil && today.length != 0)
//        {
//            retStr = [NSString stringWithFormat:@"%@ %@",str,today];
//        }else
//        {
//            
//            NSString *weekStr = [BIUtilDate getShowWeek:dateStr];
//            
//            retStr = [NSString stringWithFormat:@"%@ %@",str,weekStr];
//        }
    }else
    {
        NSString *str = [BIUtilDate stringOfDate:startDate dateFormat:@"yyyy年"];
        NSString *weekStr = [BIUtilDate getShowWeekByDate:startDate];
        retStr = [NSString stringWithFormat:@"%@ %@",str,weekStr];

    }
    return retStr;
}

#pragma mark 将yyyyMMdd字符串转成yyyy年MM月dd日格式
+ (NSString *)getShowStrByDateStr:(NSString *)dateStr
{
    NSDate *date = [BIUtilDate dateFromString:dateStr formate:SIMPLEFORMATTYPESTRING6];
    
    NSString *retStr = [BIUtilDate dateFormateWithDate:date formate:SIMPLEFORMATTYPESTRING9];
    
    return retStr;
}

#pragma mark 格式化日期到字符串
+ (NSString *)dateFormateWithDate:(NSDate *)date formate:(NSString *)formate
{
    //    if(dateFormater == nil)
    //    {
    NSDateFormatter *dateFormater = [BIUtilDate getCurrentDateFormatter];
    //    }
    //    [dateFormaterLock lock];
    
    if(formate == nil || [formate isEqualToString:@""])
    {
        [dateFormater setDateFormat:@"yyyy-MM-dd"];
    }else
    {
        [dateFormater setDateFormat:formate];
    }
    
    NSString *str = [dateFormater stringFromDate:date];
    //    [dateFormaterLock unlock];
    
    return str;
}

#pragma mark 日期字符串转换为日期对象
+ (NSDate *)dateFromString:(NSString *)dateString formate:(NSString *)formate
{
    NSDateFormatter *dateFormater = [BIUtilDate getCurrentDateFormatter];
    
    if(formate == nil || [formate isEqualToString:@""])
    {
        [dateFormater setDateFormat:@"yyyy-MM-dd"];
    }else
    {
        [dateFormater setDateFormat:formate];
    }
    NSDate *retDate = [dateFormater dateFromString:dateString];
    
    if (!retDate) {
        NSTimeZone *displayTimeZone = [NSTimeZone timeZoneWithName:[BIUtilDate displayTimeZone]];
        NSTimeZone *storageTimeZone = [NSTimeZone timeZoneWithName:[BIUtilDate storageTimeZone]];
        
        [dateFormater setTimeZone:storageTimeZone];
        retDate = [dateFormater dateFromString:dateString];
        NSInteger intervalSeconds = [displayTimeZone secondsFromGMT];
        retDate = [retDate dateByAddingTimeInterval:-intervalSeconds];
    }
    
    
    return retDate;
}
/*
+ (NSDate *)dateFromString:(NSString *)str formate:(NSString *)formate
{
    //    if(dateFormater == nil)
    //    {
    NSDateFormatter *dateFormater = [[BIUtilDate getCurrentDateFormatter] retain];
    //    }else
    //    {
    //        NSTimeZone *tz = [NSTimeZone timeZoneWithName:@"GMT"];
    //        [dateFormater setTimeZone:tz];
    //    }
    
    
    //    [dateFormaterLock lock];
    if(formate == nil || [formate isEqualToString:@""])
    {
        [dateFormater setDateFormat:@"yyyy-MM-dd"];
    }else
    {
        [dateFormater setDateFormat:formate];
    }
    //    [dateFormater setTimeZone:[NSTimeZone localTimeZone]];
    NSDate *date = [dateFormater dateFromString:str];
    [dateFormater release];
    //    [dateFormaterLock unlock];
    
    return date;
}*/

#pragma mark 获取当前日期格式器
+ (NSDateFormatter *)getCurrentDateFormatter
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [dateFormater setTimeZone:[NSTimeZone timeZoneWithName:[BIUtilDate displayTimeZone]]];
    
    return dateFormater;
}

#pragma mark 将字符串时间转换为NSDate对象，支持2种字幅创格式
+ (NSDate *)convertStringToDate:(NSString *)dateStr
{
	if (dateStr == nil) {
		return nil;
	}
	
	int year = 0;
	int month = 0;
	int day = 0;
	int hour = 0;
	int min = 0;
    int sec = 0;
	
	if ([dateStr length] == 14) {
		year = [[dateStr substringToIndex:4] intValue];
		month = [[dateStr substringWithRange:NSMakeRange(4, 2)] intValue];
		day = [[dateStr substringWithRange:NSMakeRange(6, 2)] intValue];
		hour = [[dateStr substringWithRange:NSMakeRange(8, 2)] intValue];
		min = [[dateStr substringWithRange:NSMakeRange(10, 2)] intValue];
        sec = [[dateStr substringWithRange:NSMakeRange(12, 2)] intValue];
		
		NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
		NSDateComponents *dateComponents =  [[NSDateComponents alloc] init];
		[dateComponents setYear:year];
		[dateComponents setMonth:month];
		[dateComponents setDay:day];
		[dateComponents setHour:hour];
		[dateComponents setMinute:min];
        [dateComponents setSecond:sec];
		NSDate *newDate = [calendar dateFromComponents:dateComponents];
		return newDate;
	}
	else if ([dateStr length] > 19){
		year = [[dateStr substringToIndex:4] intValue];
		month = [[dateStr substringWithRange:NSMakeRange(5, 2)] intValue];
		day = [[dateStr substringWithRange:NSMakeRange(8, 2)] intValue];
		hour = [[dateStr substringWithRange:NSMakeRange(11, 2)] intValue];
		min = [[dateStr substringWithRange:NSMakeRange(14, 2)] intValue];
		
		NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
        [calendar setTimeZone:[NSTimeZone timeZoneWithName:[BIUtilDate displayTimeZone]]];
		NSDateComponents *dateComponents =  [[NSDateComponents alloc] init];
		[dateComponents setYear:year];
		[dateComponents setMonth:month];
		[dateComponents setDay:day];
		[dateComponents setHour:hour];
		[dateComponents setMinute:min];
		NSDate *newDate = [calendar dateFromComponents:dateComponents];
        
		return newDate;
	}
	
	return nil;
}

#pragma mark 获取相隔某个时间段的日期
+ (NSDate *)calculateDate:(NSDate *)date field:(int)field amount:(int)amount
{
    if(date == nil)
    {
        return nil;
    }
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    
    switch (field)
    {
		case 1:
            [comps setYear:comps.year + amount];
			break;
		case 2:
            [comps setMonth:comps.month + amount];
			break;
		case 3:
            [comps setDay:comps.day + amount];
			break;
		case 4:
            [comps setHour:comps.hour + amount];
			break;
		case 5:
            [comps setMinute:comps.minute + amount];
			break;
		case 6:
            [comps setSecond:comps.second + amount];
			break;
    }
    
    NSDate *theStartDate  = [calendar dateFromComponents:comps];
    
    return theStartDate;
}
#pragma mark ----------两个日期判断----------

#pragma mark 将两个日期进行比较，返回两个日期相差的秒数 ，如果有一个日期为nil则返回-1
+ (long)compareCalendarByLevel:(NSDate *)firstDate  secondDate:(NSDate *)secondDate
{
    if(firstDate == nil || secondDate == nil)
    {
        return -1;
    }
    
    long time = [firstDate timeIntervalSinceDate:secondDate];

    return time;
}


#pragma mark 两个日期字串进行比较相差秒数，有一个字串为空则返回-1
+ (long)compareDateStringByLevel:(NSString *)firstDateStr secondDate:(NSString *)secondDateStr
{
    NSDate *firstDate = [BIUtilDate dateFromString:firstDateStr formate:SIMPLEFORMATTYPESTRING6];
    
    NSDate *secondDate = [BIUtilDate dateFromString:secondDateStr formate:SIMPLEFORMATTYPESTRING6];
    
    return [BIUtilDate compareCalendarByLevel:firstDate secondDate:secondDate];
}

#pragma mark 两个日期字串是否相等
+ (BOOL)dateStringEquls:(NSString *)firstDate secondDate:(NSString *)secondDate
{
    NSDate *startDate = [BIUtilDate dateFromString:firstDate formate:SIMPLEFORMATTYPESTRING6];
    
    NSDate *nowDate  = [BIUtilDate dateFromString:secondDate formate:SIMPLEFORMATTYPESTRING6];
    
    NSCalendar *chineseClendar = [BIUtilDate getCurrentCalendar];
    
    NSUInteger unitFlags =  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;  
    
    NSDateComponents *DateComponent = [chineseClendar components:unitFlags fromDate:startDate toDate:nowDate options:0];  

    NSInteger diffYear = [DateComponent year];
    NSInteger diffMon = [DateComponent month];
    NSInteger diffDay = [DateComponent day];
    NSInteger diffHour = [DateComponent hour];
    NSInteger diffMinute = [DateComponent minute];
    NSInteger diffSecond = [DateComponent second];

    BOOL isEqual = YES;
    
    if(diffYear != 0 || diffMon != 0 || diffDay != 0 || diffHour != 0 || diffMinute != 0 || diffSecond != 0)
    {
        isEqual = NO;
    }
    
    return isEqual;
}


#pragma mark firstDate是否晚于secondDate
+ (BOOL)firstDateStrAfterSecondDateStr:(NSString *)firstDate secondDate:(NSString *)secondDate
{

    if(firstDate != nil && secondDate != nil && firstDate.length == secondDate.length && firstDate.length >= 8){
        long first = [[firstDate substringToIndex:8] intValue];
        long second = [[secondDate substringToIndex:8] intValue];
        
        long subFirst = [[firstDate substringFromIndex:8] intValue];
        long subSecond = [[secondDate substringFromIndex:8] intValue];
        
        if(first > second || (first == second && subFirst > subSecond))
        {
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
}


#pragma mark firstDate是否早于secondDate
+ (BOOL)firstDateStrBeforeSecondDateStr:(NSString *)firstDate secondDate:(NSString *)secondDate
{
    
    if(firstDate != nil && secondDate != nil && firstDate.length == secondDate.length && firstDate.length >= 8){

    long first = [[firstDate substringToIndex:8] intValue];
    long second = [[secondDate substringToIndex:8] intValue];
    
    long subFirst = [[firstDate substringFromIndex:8] intValue];
    long subSecond = [[secondDate substringFromIndex:8] intValue];
    
    if(first < second || (first == second && subFirst < subSecond))
    {
        return YES;
    }else{
        return NO;
    }
    }else{
        return NO;
    }
}


#pragma mark 两个日期 是否相等
+ (BOOL)firstDateStrEquleSecondDateStr:(NSDate *)firstDate secondDate:(NSDate *)secondDate
{    
    NSString *firstStr = [BIUtilDate dateFormateWithDate:firstDate formate:@"yyyyMMddHHmmss"];
    NSString *secondStr = [BIUtilDate dateFormateWithDate:secondDate formate:@"yyyyMMddHHmmss"];
    
    if([firstStr isEqualToString:secondStr])
    {
        return YES;
    }
    
    return NO;
}


#pragma mark firstCalendar是否晚于seCalendar
+ (BOOL)firstCalendarAfterSecondCalendar:(NSDate *)firstDate secondDate:(NSDate *)secondDate
{
    NSString *firstStr = [BIUtilDate dateFormateWithDate:firstDate formate:@"yyyyMMddHHmmss"];
    NSString *secondStr = [BIUtilDate dateFormateWithDate:secondDate formate:@"yyyyMMddHHmmss"];
    
    long first = [[firstStr substringToIndex:8] intValue];
    long second = [[secondStr substringToIndex:8] intValue];
    
    long subFirst = [[firstStr substringFromIndex:8] intValue];
    long subSecond = [[secondStr substringFromIndex:8] intValue];
    
    if(first > second || (first == second && subFirst > subSecond))
    {
        return YES;
    }
    
    return NO;
}



#pragma mark firstDate是否早于secondDate
+ (BOOL)firstCalendarBeforeSecondCalendar:(NSDate *)firstDate secondDate:(NSDate *)secondDate
{
    NSString *firstDateStr = [BIUtilDate dateFormateWithDate:firstDate formate:@"yyyyMMddHHmmss"];
    NSString *secondDateStr = [BIUtilDate dateFormateWithDate:secondDate formate:@"yyyyMMddHHmmss"];
    
    int first = [[firstDateStr substringToIndex:8] intValue];
    int second = [[secondDateStr substringToIndex:8] intValue];
    
    int subFirst = [[firstDateStr substringFromIndex:8] intValue];
    int subSecond = [[secondDateStr substringFromIndex:8] intValue];
    
    if(first < second || (first == second && subFirst < subSecond))
    {
        return YES;
    }
    
    return NO;
}


#pragma mark 两个日期 是否相等
+ (BOOL)firstCalendarEquleSecondCalendar:(NSDate *)firstDate secondDate:(NSDate *)secondDate
{
    NSString *firstStr = [BIUtilDate dateFormateWithDate:firstDate formate:@"yyyyMMddHHmmss"];
    NSString *secondStr = [BIUtilDate dateFormateWithDate:secondDate formate:@"yyyyMMddHHmmss"];
    
    if([firstStr isEqualToString:secondStr])
    {
        return YES;
    }
    
    return NO;
}

#pragma mark 比较前一个日期是否和后一个日期相等
+ (BOOL)firstDateEquleSecondDate:(NSDate *)firstDate secondDate:(NSDate *)secondDate
{
    NSString *firstStr = [BIUtilDate dateFormateWithDate:firstDate formate:@"yyyyMMdd"];
    NSString *secondStr = [BIUtilDate dateFormateWithDate:secondDate formate:@"yyyyMMdd"];
    
    if([firstStr isEqualToString:secondStr])
    {
        return YES;
    }
    
    return NO;
}


#pragma mark firstDate是否早于secondDate
+ (BOOL )firstDateLessThanSecondDate:(NSDate *)firstDate secondDate:(NSDate *)secondDate
{
    NSString *firstStr = [BIUtilDate dateFormateWithDate:firstDate formate:@"yyyyMMdd"];
    NSString *secondStr = [BIUtilDate dateFormateWithDate:secondDate formate:@"yyyyMMdd"];
    
    if([firstStr integerValue] < [secondStr integerValue])
    {
        return YES;
    }
    
    return NO;
}


#pragma mark firstDate是否晚于secondDate
+ (BOOL )firstDateAboveThanSecondDate:(NSDate *)firstDate secondDate:(NSDate *)secondDate
{
    NSString *firstStr = [BIUtilDate dateFormateWithDate:firstDate formate:@"yyyyMMdd"];
    NSString *secondStr = [BIUtilDate dateFormateWithDate:secondDate formate:@"yyyyMMdd"];
    
    if([firstStr integerValue] > [secondStr integerValue])
    {
        return YES;
    }
    
    return NO;
}

#pragma mark 输入的日期，是否在开始日期和结束日期之间
+ (BOOL)isMiddleDateWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate middleDate:(NSDate *)currendDate
{
    BOOL isMiddle = NO;
    
    NSString *startDateStr = [BIUtilDate dateFormateWithDate:startDate formate:@"yyyyMMdd"];
    NSInteger start = [startDateStr integerValue];
    
    NSString *endDateStr = [BIUtilDate dateFormateWithDate:endDate formate:@"yyyyMMdd"];
    NSInteger end = [endDateStr integerValue];
    
    NSString *currendDateStr = [BIUtilDate dateFormateWithDate:currendDate formate:@"yyyyMMdd"];
    NSInteger currend = [currendDateStr integerValue];

    if(currend < end && currend > start)
    {
        isMiddle = YES;
    }
    
    return isMiddle;
}


#pragma mark firstDate是否晚于当前日期
+ (BOOL)dateCalendarAfterToday:(NSDate *)firstDate
{
    NSDate *today = [NSDate date];
    
    return [BIUtilDate firstCalendarAfterSecondCalendar:firstDate secondDate:today];
}


#pragma mark firstDate是否等于当前日期
+ (BOOL )dateCalendarEqulsToday:(NSDate *)firstDate
{
    NSDate *today = [NSDate date];
    
    return [BIUtilDate firstCalendarEquleSecondCalendar:firstDate secondDate:today];
}


#pragma mark firstDate是否早于当前日期
+ (BOOL )dateCalendarBeforeToday:(NSDate *)firstDate
{
    NSDate *today = [NSDate date];
    
    return [BIUtilDate firstCalendarBeforeSecondCalendar:firstDate secondDate:today];
}


#pragma mark firstDate是否晚于当前日期
+ (BOOL )dateStringAfterToday:(NSString *)firstDateStr
{
    NSDate *today = [NSDate date];
    NSString *todayStr = [BIUtilDate dateFormateWithDate:today formate:SIMPLEFORMATTYPESTRING6];
    today = [BIUtilDate dateFromString:todayStr formate:SIMPLEFORMATTYPESTRING6];
    
    NSDate *firstDate = [BIUtilDate dateFromString:firstDateStr formate:SIMPLEFORMATTYPESTRING6];
    
    return [BIUtilDate firstCalendarAfterSecondCalendar:firstDate secondDate:today];
}


#pragma mark firstDate是否早于当前日期
+ (BOOL)dateStringBeforeToday:(NSString *)firstDateStr
{
    NSDate *today = [NSDate date];
    NSString *todayStr = [BIUtilDate dateFormateWithDate:today formate:SIMPLEFORMATTYPESTRING6];
    today = [BIUtilDate dateFromString:todayStr formate:SIMPLEFORMATTYPESTRING6];
    
    NSDate *firstDate = [BIUtilDate dateFromString:firstDateStr formate:SIMPLEFORMATTYPESTRING6];
    
    return [BIUtilDate firstCalendarBeforeSecondCalendar:firstDate secondDate:today];
}

#pragma mark 判断传入进来的日期，是否在当前日期之前
+ (BOOL)getDateStringBeforeToday:(NSString *)firstDateStr
{
    NSDate *today = [NSDate date];
//    NSString *todayStr = [BIUtilDate dateFormateWithDate:today formate:SIMPLEFORMATTYPESTRING1];
    
    NSDate *firstDate = [BIUtilDate dateFromString:firstDateStr formate:SIMPLEFORMATTYPESTRING1];

//    TLog(@"todayStr===%@===,firstDate====%@===",todayStr,firstDate);
    
    return [BIUtilDate firstCalendarBeforeSecondCalendar:firstDate secondDate:today];
}


#pragma mark firstDate是否等于当前日期
+ (BOOL )dateStringEqulsToday:(NSString *)firstDateStr
{
    NSDate *today = [NSDate date];
    NSString *todayStr = [BIUtilDate dateFormateWithDate:today formate:SIMPLEFORMATTYPESTRING6];
    today = [BIUtilDate dateFromString:todayStr formate:SIMPLEFORMATTYPESTRING6];

    
    NSDate *firstDate = [BIUtilDate dateFromString:firstDateStr formate:SIMPLEFORMATTYPESTRING6];
    
    return [BIUtilDate firstCalendarEquleSecondCalendar:firstDate secondDate:today];
}

#pragma mark - 2012-2022 国定节假日
+ (NSString *)getHolidayString:(NSString *)dateStr
{
    if (dateStr == nil || dateStr.length < 8)
        return @"";
    int inYear = [[dateStr substringToIndex:4] intValue];//StringUtil.toInt(dateStr.substring(0, 4));

    NSRange rangeMonth = NSMakeRange(4, 2);
    int inMonth = [[dateStr substringWithRange:rangeMonth] intValue];//StringUtil.toInt(dateStr.substring(4, 6));

    NSRange rangeDay = NSMakeRange(6, 2);
    int inDate = [[dateStr substringWithRange:rangeDay] intValue];//StringUtil.toInt(dateStr.substring(6, 8));
    switch (inYear) {
		case 2012:
			switch (inMonth) {
                case 1:
                    switch (inDate) {
                        case 1:
                            return @"元旦";
                            //				case 22:
                            //					return "除夕";
                        case 23:
                            return @"春节";
                    }
                    break;
                case 2:
                    switch (inDate) {
                        case 14:
                            return @"情人节";
                    }
                    break;
                case 4:
                    switch (inDate) {
                        case 4:
                            return @"清明节";
                    }
                    break;
                case 5:
                    switch (inDate) {
                        case 1:
                            return @"劳动节";
                    }
                    break;
                case 6:
                    switch (inDate) {
                        case 23:
                            return @"端午节";
                    }
                    break;
                case 9:
                    switch (inDate) {
                        case 30:
                            return @"中秋节";
                    }
                    break;
                case 10:
                    switch (inDate) {
                        case 1:
                            return @"国庆节";
                    }
                    break;
                case 12:
                    switch (inDate) {
                        case 25:
                            return @"圣诞节";
                    }
			}
			break;
		case 2013:
			switch (inMonth) {
                case 1:
                    switch (inDate) {
                        case 1:
                            return @"元旦";
                    }
                    break;
                case 2:
                    switch (inDate) {
                            //				case 9:
                            //					return "除夕";
                        case 10:
                            return @"春节";
                        case 14:
                            return @"情人节";
                    }
                    break;
                case 4:
                    switch (inDate) {
                        case 4:
                            return @"清明节";
                    }
                    break;
                case 5:
                    switch (inDate) {
                        case 1:
                            return @"劳动节";
                    }
                    break;
                case 6:
                    switch (inDate) {
                        case 12:
                            return @"端午节";
                    }
                    break;
                case 9:
                    switch (inDate) {
                        case 19:
                            return @"中秋节";
                    }
                    break;
                case 10:
                    switch (inDate) {
                        case 1:
                            return @"国庆节";
                    }
                    break;
                case 12:
                    switch (inDate) {
                        case 25:
                            return @"圣诞节";
                    }
			}
			break;
		case 2014:
			switch (inMonth) {
                case 1:
                    switch (inDate) {
                        case 1:
                            return @"元旦";
                            //				case 30:
                            //					return "除夕";
                        case 31:
                            return @"春节";
                    }
                    break;
                case 2:
                    switch (inDate) {
                            
                        case 14:
                            return @"情人节";
                    }
                    break;
                case 4:
                    switch (inDate) {
                        case 5:
                            return @"清明节";
                    }
                    break;
                case 5:
                    switch (inDate) {
                        case 1:
                            return @"劳动节";
                    }
                    break;
                case 6:
                    switch (inDate) {
                        case 2:
                            return @"端午节";
                    }
                    break;
                case 9:
                    switch (inDate) {
                        case 8:
                            return @"中秋节";
                    }
                    break;
                case 10:
                    switch (inDate) {
                        case 1:
                            return @"国庆节";
                    }
                    break;
                case 12:
                    switch (inDate) {
                        case 25:
                            return @"圣诞节";
                    }
			}
			break;
		case 2015:
			switch (inMonth) {
                case 1:
                    switch (inDate) {
                        case 1:
                            return @"元旦";
                    }
                    break;
                case 2:
                    switch (inDate) {
                            //				case 18:
                            //					return "除夕";
                        case 19:
                            return @"春节";
                        case 14:
                            return @"情人节";
                    }
                    break;
                case 4:
                    switch (inDate) {
                        case 5:
                            return @"清明节";
                    }
                    break;
                case 5:
                    switch (inDate) {
                        case 1:
                            return @"劳动节";
                    }
                    break;
                case 6:
                    switch (inDate) {
                        case 20:
                            return @"端午节";
                    }
                    break;
                case 9:
                    switch (inDate) {
                        case 27:
                            return @"中秋节";
                    }
                    break;
                case 10:
                    switch (inDate) {
                        case 1:
                            return @"国庆节";
                    }
                    break;
                case 12:
                    switch (inDate) {
                        case 25:
                            return @"圣诞节";
                    }
			}
			break;
		case 2016:
			switch (inMonth) {
                case 1:
                    switch (inDate) {
                        case 1:
                            return @"元旦";
                    }
                    break;
                case 2:
                    switch (inDate) {
                            //				case 7:
                            //					return "除夕";
                        case 8:
                            return @"春节";
                        case 14:
                            return @"情人节";
                    }
                    break;
                case 4:
                    switch (inDate) {
                        case 4:
                            return @"清明节";
                    }
                    break;
                case 5:
                    switch (inDate) {
                        case 1:
                            return @"劳动节";
                    }
                    break;
                case 6:
                    switch (inDate) {
                        case 9:
                            return @"端午节";
                    }
                    break;
                case 9:
                    switch (inDate) {
                        case 15:
                            return @"中秋节";
                    }
                    break;
                case 10:
                    switch (inDate) {
                        case 1:
                            return @"国庆节";
                    }
                    break;
                case 12:
                    switch (inDate) {
                        case 25:
                            return @"圣诞节";
                    }
			}
			break;
		case 2017:
			switch (inMonth) {
                case 1:
                    switch (inDate) {
                        case 1:
                            return @"元旦";
                            //				case 27:
                            //					return "除夕";
                        case 28:
                            return @"春节";
                    }
                    break;
                case 2:
                    switch (inDate) {
                        case 14:
                            return @"情人节";
                    }
                    break;
                case 4:
                    switch (inDate) {
                        case 4:
                            return @"清明节";
                    }
                    break;
                case 5:
                    switch (inDate) {
                        case 1:
                            return @"劳动节";
                        case 30:
                            return @"端午节";
                    }
                    break;
                case 10:
                    switch (inDate) {
                        case 1:
                            return @"国庆节";
                        case 4:
                            return @"中秋节";
                    }
                    break;
                case 12:
                    switch (inDate) {
                        case 25:
                            return @"圣诞节";
                    }
			}
			break;
		case 2018:
			switch (inMonth) {
                case 1:
                    switch (inDate) {
                        case 1:
                            return @"元旦";
                    }
                    break;
                case 2:
                    switch (inDate) {
                        case 14:
                            return @"情人节";
                            //				case 15:
                            //					return "除夕";
                        case 16:
                            return @"春节";
                    }
                    break;
                case 4:
                    switch (inDate) {
                        case 5:
                            return @"清明节";
                    }
                    break;
                case 5:
                    switch (inDate) {
                        case 1:
                            return @"劳动节";
                    }
                    break;
                case 6:
                    switch (inDate) {
                        case 18:
                            return @"端午节";
                    }
                    break;
                case 9:
                    switch (inDate) {
                        case 24:
                            return @"中秋节";
                    }
                    break;
                case 10:
                    switch (inDate) {
                        case 1:
                            return @"国庆节";
                    }
                    break;
                case 12:
                    switch (inDate) {
                        case 25:
                            return @"圣诞节";
                    }
			}
			break;
		case 2019:
			switch (inMonth) {
                case 1:
                    switch (inDate) {
                        case 1:
                            return @"元旦";
                    }
                    break;
                case 2:
                    switch (inDate) {
                            //				case 4:
                            //					return "除夕";
                        case 5:
                            return @"春节";
                        case 14:
                            return @"情人节";
                    }
                    break;
                case 4:
                    switch (inDate) {
                        case 5:
                            return @"清明节";
                    }
                    break;
                case 5:
                    switch (inDate) {
                        case 1:
                            return @"劳动节";
                    }
                    break;
                case 6:
                    switch (inDate) {
                        case 7:
                            return @"端午节";
                    }
                    break;
                case 9:
                    switch (inDate) {
                        case 13:
                            return @"中秋节";
                    }
                    break;
                case 10:
                    switch (inDate) {
                        case 1:
                            return @"国庆节";
                    }
                    break;
                case 12:
                    switch (inDate) {
                        case 25:
                            return @"圣诞节";
                    }
			}
			break;
		case 2020:
			switch (inMonth) {
                case 1:
                    switch (inDate) {
                        case 1:
                            return @"元旦";
                            //				case 24:
                            //					return "除夕";
                        case 25:
                            return @"春节";
                    }
                    break;
                case 2:
                    switch (inDate) {
                        case 14:
                            return @"情人节";
                    }
                    break;
                case 4:
                    switch (inDate) {
                        case 4:
                            return @"清明节";
                    }
                    break;
                case 5:
                    switch (inDate) {
                        case 1:
                            return @"劳动节";
                    }
                    break;
                case 6:
                    switch (inDate) {
                        case 25:
                            return @"端午节";
                    }
                    break;
                case 10:
                    switch (inDate) {
                        case 1:
                            return @"国庆节";
                    }
                    break;
                case 12:
                    switch (inDate) {
                        case 25:
                            return @"圣诞节";
                    }
			}
			break;
		case 2021:
			switch (inMonth) {
                case 1:
                    switch (inDate) {
                        case 1:
                            return @"元旦";
                    }
                    break;
                case 2:
                    switch (inDate) {
                            //				case 11:
                            //					return "除夕";
                        case 12:
                            return @"春节";
                        case 14:
                            return @"情人节";
                    }
                    break;
                case 4:
                    switch (inDate) {
                        case 4:
                            return @"清明节";
                    }
                    break;
                case 5:
                    switch (inDate) {
                        case 1:
                            return @"劳动节";
                    }
                    break;
                case 6:
                    switch (inDate) {
                        case 14:
                            return @"端午节";
                    }
                    break;
                case 9:
                    switch (inDate) {
                        case 21:
                            return @"中秋节";
                    }
                    break;
                case 10:
                    switch (inDate) {
                        case 1:
                            return @"国庆节";
                    }
                    break;
                case 12:
                    switch (inDate) {
                        case 25:
                            return @"圣诞节";
                    }
			}
			break;
		case 2022:
			switch (inMonth) {
                case 1:
                    switch (inDate) {
                        case 1:
                            return @"元旦";
                            //				case 31:
                            //					return "除夕";
                    }
                    break;
                case 2:
                    switch (inDate) {
                        case 1:
                            return @"春节";
                        case 14:
                            return @"情人节";
                    }
                    break;
                case 4:
                    switch (inDate) {
                        case 5:
                            return @"清明节";
                    }
                    break;
                case 5:
                    switch (inDate) {
                        case 1:
                            return @"劳动节";
                    }
                    break;
                case 6:
                    switch (inDate) {
                        case 3:
                            return @"端午节";
                    }
                    break;
                case 9:
                    switch (inDate) {
                        case 10:
                            return @"中秋节";
                    }
                    break;
                case 10:
                    switch (inDate) {
                        case 1:
                            return @"国庆节";
                    }
                    break;
                case 12:
                    switch (inDate) {
                        case 25:
                            return @"圣诞节";
                    }
			}
			break;
		default:
			break;
    }
    return @"";
}



#pragma mark - ----------日期生成----------
#pragma mark 转换 年月日 到 日期字符串
+ (NSString *)getDateStringWithYear:(NSInteger )year month:(NSInteger )month day:(NSInteger )day
{
    if(year == 0 || month == 0 || day == 0)
    {
        return nil;
    }
    return [BIUtilDate getDateStringWithYear:year month:month day:day hour:0 minute:0 second:0];
}


#pragma mark 转换 年月日时分秒 到 日期字符串
+ (NSString *)getDateStringWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second
{
    NSDate *date = [BIUtilDate getDateWithYear:year month:month day:day hour:hour minute:minute second:second];
    
    NSString *retStr = [BIUtilDate stringOfDate:date dateFormat:SIMPLEFORMATTYPESTRING2];
    
    return retStr;
}

#pragma mark 转换 年月日 到 日期
+ (NSDate *)getDateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{

    NSDate *date = [BIUtilDate getDateWithYear:year month:month day:day hour:0 minute:0 second:0];
    
    return date;
}


#pragma mark 转换 年月日时分秒 到 日期
+ (NSDate *)getDateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second
{
    NSDate *date = [NSDate date];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    
    [comps setYear:year];
    [comps setMonth:month];
    [comps setDay:day];
    [comps setHour:hour];
    [comps setMinute:minute];
    [comps setSecond:second];
    
    NSDate *theStartDate  = [calendar dateFromComponents:comps];
    
    return theStartDate;
}

#pragma mark - ----------获取两天之间间隔事件----------
#pragma mark 获取两天之间相差多少天
+ (NSInteger)compareDaysFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    if(startDate == nil || endDate == nil){
        return -1;
    }
    
    NSString *sDate = [BIUtilDate dateFormateWithDate:startDate formate:@"yyyyMMdd"];
    startDate = [BIUtilDate dateFromString:sDate formate:@"yyyyMMdd"];
    
    NSString *seDate = [BIUtilDate dateFormateWithDate:endDate formate:@"yyyyMMdd"];
    endDate = [BIUtilDate dateFromString:seDate formate:@"yyyyMMdd"];
    
    long time = [startDate timeIntervalSinceDate:endDate];
    
    int days = time/(60*60*24);
    
    return abs(days);
}


+ (NSInteger)compareDaysWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    if(startDate == nil || endDate == nil){
        return -1;
    }
    
    NSString *sDate = [BIUtilDate dateFormateWithDate:startDate formate:@"yyyyMMdd"];
    startDate = [BIUtilDate dateFromString:sDate formate:@"yyyyMMdd"];
    
    NSString *seDate = [BIUtilDate dateFormateWithDate:endDate formate:@"yyyyMMdd"];
    endDate = [BIUtilDate dateFromString:seDate formate:@"yyyyMMdd"];
    
    long time = [endDate timeIntervalSinceDate:startDate];
    
    int days = time/(60*60*24);
    
    return days;
}


#pragma mark 获取两天之间相差多少天
+ (NSInteger)compareDaysFromStartDateStr:(NSString *)startDateStr endDateStr:(NSString *)endDateStr
{
    if(startDateStr == nil || endDateStr == nil)
    {
        return -1;
    }

    if(startDateStr.length > 8)
    {
        startDateStr = [startDateStr substringToIndex:8];
    }
    
    if(endDateStr.length > 8)
    {
        endDateStr = [endDateStr substringToIndex:8];
    }

    NSDate *startDate = [BIUtilDate dateFromString:startDateStr formate:@"yyyyMMdd"];
    NSDate *endDate = [BIUtilDate dateFromString:endDateStr formate:@"yyyyMMdd"];
    
    long time = [startDate timeIntervalSinceDate:endDate];
    
    int days = time/(60*60*24);
    
    return abs(days);
}

#pragma mark 获取两天之间相差多少天,可能是负数
+ (NSInteger)compareDaysWithoutABSFromStartDateStr:(NSString *)startDateStr endDateStr:(NSString *)endDateStr
{
    if(startDateStr == nil || endDateStr == nil)
    {
        return -1;
    }
    
    if(startDateStr.length > 8)
    {
        startDateStr = [startDateStr substringToIndex:8];
    }
    
    if(endDateStr.length > 8)
    {
        endDateStr = [endDateStr substringToIndex:8];
    }
    
    NSDate *startDate = [BIUtilDate dateFromString:startDateStr formate:@"yyyyMMdd"];
    NSDate *endDate = [BIUtilDate dateFromString:endDateStr formate:@"yyyyMMdd"];
    
    long time = [startDate timeIntervalSinceDate:endDate];
    
    int days = time/(60*60*24);
    
    return days;
}

+ (NSDateComponents*) compareFromDate:(NSString *)startDateStr toDate:(NSString *)endDateStr {
    NSDate *startDate = [BIUtilDate dateFromString:startDateStr formate:@"yyyyMMdd"] ;
    NSDate *endDate   = [BIUtilDate dateFromString:endDateStr formate:@"yyyyMMdd"] ;
    
    NSCalendar* calendar_ = [BIUtilDate getCurrentCalendar];;
    
    NSDateComponents* formatter = [calendar_ components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:startDate toDate:endDate options:0] ;

    return formatter ;
}

+ (NSDateComponents *)compareFromDateTime:(NSString *)startDateTimeStr toDateTime:(NSString *)endDateTimeStr
{
    NSDate *startDate = [BIUtilDate dateFromString:startDateTimeStr formate:@"yyyyMMddHHmmss"] ;
    NSDate *endDate   = [BIUtilDate dateFromString:endDateTimeStr formate:@"yyyyMMddHHmmss"] ;
    
    NSCalendar* calendar_ = [BIUtilDate getCurrentCalendar];;
    
    NSDateComponents* formatter = [calendar_ components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit fromDate:startDate toDate:endDate options:0] ;
    
    return formatter ;
}


#pragma mark 获取两天之间相差多少分钟
+ (NSInteger)compareMinutesFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    if(startDate == nil || endDate == nil)
    {
        return -1;
    }
    

    NSString *sDate = [BIUtilDate dateFormateWithDate:startDate formate:@"yyyyMMddHHmm"];
    startDate = [BIUtilDate dateFromString:sDate formate:@"yyyyMMddHHmm"];
    
    NSString *seDate = [BIUtilDate dateFormateWithDate:endDate formate:@"yyyyMMddHHmm"];
    endDate = [BIUtilDate dateFromString:seDate formate:@"yyyyMMddHHmm"];
    
    BILog(@"startDate===%@==,endDate===%@==",startDate,endDate);
    
    long time = [startDate timeIntervalSinceDate:endDate];
    
    int minutes = time/(60);
    
    return abs(minutes);
}

#pragma mark 获取两天之间相差多少秒
+ (NSInteger)compareSecondFromStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    if(startDate == nil || endDate == nil)
    {
        return -1;
    }
    
    
    NSString *sDate = [BIUtilDate dateFormateWithDate:startDate formate:@"yyyyMMddHHmm"];
    startDate = [BIUtilDate dateFromString:sDate formate:@"yyyyMMddHHmm"];
    
    NSString *seDate = [BIUtilDate dateFormateWithDate:endDate formate:@"yyyyMMddHHmm"];
    endDate = [BIUtilDate dateFromString:seDate formate:@"yyyyMMddHHmm"];
    
    BILog(@"startDate===%@==,endDate===%@==",startDate,endDate);
    
    long time = [startDate timeIntervalSinceDate:endDate];
    
//    int minutes = time/(60);
    
    return abs(time);
}

#pragma mark - ----------获取某月的第一天和最后一天----------

#pragma mark 获取一个月的最后一天
+ (NSDate *)getLastDateOfMonthWithDate:(NSDate *)date
{
    NSDate *retDate = nil;
    
    if(date != nil)
    {
        NSInteger days = [BIUtilDate getDaysOfMonth:date];
        NSInteger month = [BIUtilDate getMonth:date];
        NSInteger year = [BIUtilDate getYear:date];
        
        retDate = [BIUtilDate getDateWithYear:year month:month day:days];
    }

    return retDate;
}


#pragma mark 获取一个月的第一天
+ (NSDate *)getFirstDateOfMonthWithDate:(NSDate *)date
{
    NSDate *retDate = nil;
    
    if(date != nil)
    {
        NSInteger month = [BIUtilDate getMonth:date];
        NSInteger year = [BIUtilDate getYear:date];
        
        retDate = [BIUtilDate getDateWithYear:year month:month day:1];
    }
    
    return retDate;
}


#pragma mark 根据日期返回对应的周几
+ (NSString *)getShowWeekByDate1:(NSDate *)date
{
    NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    
    NSString *dateStr = @"";
    
    switch (week)
    {
        case 1:
            dateStr = @"周日";
            break;
        case 2:
            dateStr = @"周一";
            break;
        case 3:
            dateStr = @"周二";
            break;
        case 4:
            dateStr = @"周三";
            break;
        case 5:
            dateStr = @"周四";
            break;
        case 6:
            dateStr = @"周五";
            break;
        case 7:
            dateStr = @"周六";
            break;
        default:
            break;
    }
    
    return dateStr;
}

#pragma mark - --------------------------------农历日期处理--------------------------------
#pragma mark 使用NSDate 类型转换成公历的日期
+ (NSString *)lunarForSolar:(NSDate *)solarDate
{
    //天干名称
//    NSArray *cTianGan = [NSArray arrayWithObjects:@"甲",@"乙",@"丙",@"丁",@"戊",@"己",@"庚",@"辛",@"壬",@"癸", nil];
//    
//    //地支名称
//    NSArray *cDiZhi = [NSArray arrayWithObjects:@"子",@"丑",@"寅",@"卯",@"辰",@"巳",@"午",@"未",@"申",@"酉",@"戌",@"亥",nil];
//    
//    //属相名称
//    NSArray *cShuXiang = [NSArray arrayWithObjects:@"鼠",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪",nil];
    
    //农历日期名
    NSArray *cDayName = [NSArray arrayWithObjects:@"*",@"初一",@"初二",@"初三",@"初四",@"初五",@"初六",@"初七",@"初八",@"初九",@"初十",
                         @"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十",
                         @"廿一",@"廿二",@"廿三",@"廿四",@"廿五",@"廿六",@"廿七",@"廿八",@"廿九",@"三十",nil];
    
    //农历月份名
    NSArray *cMonName = [NSArray arrayWithObjects:@"*",@"正",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"十一",@"腊",nil];
    
    //公历每月前面的天数
    const int wMonthAdd[12] = {0,31,59,90,120,151,181,212,243,273,304,334};
    
    //农历数据
    const int wNongliData[100] = {2635,333387,1701,1748,267701,694,2391,133423,1175,396438
        ,3402,3749,331177,1453,694,201326,2350,465197,3221,3402
        ,400202,2901,1386,267611,605,2349,137515,2709,464533,1738
        ,2901,330421,1242,2651,199255,1323,529706,3733,1706,398762
        ,2741,1206,267438,2647,1318,204070,3477,461653,1386,2413
        ,330077,1197,2637,268877,3365,531109,2900,2922,398042,2395
        ,1179,267415,2635,661067,1701,1748,398772,2742,2391,330031
        ,1175,1611,200010,3749,527717,1452,2742,332397,2350,3222
        ,268949,3402,3493,133973,1386,464219,605,2349,334123,2709
        ,2890,267946,2773,592565,1210,2651,395863,1323,2707,265877};
    
    static NSInteger wCurYear,wCurMonth,wCurDay;
    static NSInteger nTheDate,nIsEnd,m,k,n,i,nBit;
    
    //取当前公历年、月、日
    NSDateComponents *components = [[BIUtilDate getCurrentCalendar] components:NSDayCalendarUnit |NSMonthCalendarUnit | NSYearCalendarUnit fromDate:solarDate];
    wCurYear = [components year];
    wCurMonth = [components month];
    wCurDay = [components day];
    
    
    //计算到初始时间1921年2月8日的天数：1921-2-8(正月初一)
    nTheDate = (wCurYear - 1921) * 365 + (wCurYear - 1921) / 4 + wCurDay + wMonthAdd[wCurMonth - 1] - 38;
    
    if((!(wCurYear % 4)) && (wCurMonth > 2))
        nTheDate = nTheDate + 1;
    
    
    //计算农历天干、地支、月、日
    nIsEnd = 0;
    m = 0;
    
    while(nIsEnd != 1)
    {
        if(wNongliData[m] < 4095)
            k = 11;
        else
            k = 12;
        n = k;
        while(n>=0)
        {
            //获取wNongliData(m)的第n个二进制位的值
            nBit = wNongliData[m];
            
            for(i=1;i<n+1;i++)
                nBit = nBit/2;
            
            nBit = nBit % 2;
            
            if (nTheDate <= (29 + nBit))
            {
                nIsEnd = 1;
                break;
            }
            
            nTheDate = nTheDate - 29 - nBit;
            n = n - 1;
        }
        
        if(nIsEnd)
            break;
        m = m + 1;
    }
    
    wCurYear = 1921 + m;
    wCurMonth = k - n + 1;
    wCurDay = nTheDate;
    
    if (k == 12)
    {
        if (wCurMonth == wNongliData[m] / 65536 + 1)
            wCurMonth = 1 - wCurMonth;
        else if (wCurMonth > wNongliData[m] / 65536 + 1)
            wCurMonth = wCurMonth - 1;
    }
    
    //生成农历天干、地支、属相
//    NSString *szShuXiang = (NSString *)[cShuXiang objectAtIndex:((wCurYear - 4) % 60) % 12];
    
//    NSString *szNongli = [NSString stringWithFormat:@"%@(%@%@)年",szShuXiang, (NSString *)[cTianGan objectAtIndex:((wCurYear - 4) % 60) % 10],(NSString *)[cDiZhi objectAtIndex:((wCurYear - 4) % 60) %12]];
    
    //生成农历月、日
    NSString *szNongliDay;
    
    if (wCurMonth < 1)
    {
        szNongliDay = [NSString stringWithFormat:@"闰%@",(NSString *)[cMonName objectAtIndex:-1 * wCurMonth]];
    }else
    {
        szNongliDay = (NSString *)[cMonName objectAtIndex:wCurMonth];
    }
    
//  NSString *lunarDate = [NSString stringWithFormat:@"%@ %@月 %@",szNongli,szNongliDay,(NSString*)[cDayName objectAtIndex:wCurDay]];
    NSString *lunarDate = [NSString stringWithFormat:@"%@月%@",szNongliDay,(NSString*)[cDayName objectAtIndex:wCurDay]];
    
    return lunarDate;
}
#pragma mark 农历一年的总天数
+ (int)yearDays:(int)year
{
    int i, sum = 348;
    for (i = 0x8000; i > 0x8; i >>= 1)
    {
        if ((lunarInfo[year - 1900] & i) != 0)
            sum += 1;
    }
    
    return sum + [BIUtilDate leapDays:year];
}


#pragma mark 农历某年闰月的天数
+ (int)leapDays:(int)year
{
    if([BIUtilDate leapMonth:year] != 0)
    {
        if ((lunarInfo[year - 1900] & 0x10000) != 0)
        {
            return 30;
        }
        else
        {
            return 29;
        }
    }
    
    return 0;
}


#pragma mark 农历某年闰哪个月1-12，没有闰月返回0
+ (int)leapMonth:(int)year
{
    return (int) (lunarInfo[year - 1900] & 0xf);
}


#pragma mark 农历 y年m月的总天数
+ (int)monthDays:(int)year month:(int)month
{
    if ((lunarInfo[year - 1900] & (0x10000 >> month)) == 0)
    {
        return 29;
    }else
    {
        return 30;
    }
}

#pragma mark - ----------2013.6.18后新增方法----------
#pragma mark 比较两个日期
+ (eCTStringComparisonResult)compareDateStringWithFirstDateString:(NSString *)firstDateString secondDateString:(NSString *)secondDateString compareStringLength:(NSUInteger)compareLength
{
    if (firstDateString.length == 0 || secondDateString.length == 0) {
        return eCTStringComparisonResultInvalid;
    }
    
    //超过长度的做裁剪
    if (firstDateString.length > compareLength) {
        firstDateString = [firstDateString substringToIndex:compareLength];
    }
    if (secondDateString.length > compareLength) {
        secondDateString = [secondDateString substringToIndex:compareLength];
    }
    
    //不够长度的做补0
    while (firstDateString.length < compareLength)
    {
        firstDateString = [NSString stringWithFormat:@"%@0",firstDateString];
    }
    while (secondDateString.length < compareLength)
    {
        secondDateString = [NSString stringWithFormat:@"%@0",secondDateString];
    }
    
    NSComparisonResult compareResult = [firstDateString compare:secondDateString];
    eCTStringComparisonResult result = eCTStringComparisonResultInvalid;
    switch (compareResult) {
        case NSOrderedAscending:
            result = eCTStringComparisonResultOrderedAscending;
            break;
        case NSOrderedSame:
            result = eCTStringComparisonResultOrderedSame;
            break;
        case NSOrderedDescending:
            result = eCTStringComparisonResultOrderedDescending;
            break;
            
        default:
            break;
    }
    
    return result;
}

+ (eCTStringComparisonResult)compareBetweenDate:(NSDate *)firstDate andDate:(NSDate *)secondDate withFormat:(NSString *)dateFormatString
{
    eCTStringComparisonResult result = eCTStringComparisonResultInvalid;
    
    if (!firstDate || !secondDate || dateFormatString.length == 0) {
        return result;
    }
    
    NSString *firstDateString = [BIUtilDate dateFormateWithDate:firstDate formate:dateFormatString];
    NSString *secondDateString = [BIUtilDate dateFormateWithDate:secondDate formate:dateFormatString];
    
    if (firstDateString.length == 0 || secondDateString.length == 0) {
        return result;
    }
    
    NSComparisonResult compareResult = [firstDateString compare:secondDateString];
    
    switch (compareResult) {
        case NSOrderedAscending:
            result = eCTStringComparisonResultOrderedAscending;
            break;
        case NSOrderedSame:
            result = eCTStringComparisonResultOrderedSame;
            break;
        case NSOrderedDescending:
            result = eCTStringComparisonResultOrderedDescending;
            break;
            
        default:
            break;
    }
    
    return result;
}

+ (NSInteger)calculateAgeWithBirthdate:(NSDate *)birthdate
{
    return [BIUtilDate calculateAgeWithBirthdate:birthdate toNowDate:[NSDate date]];
}

+ (NSInteger)calculateAgeWithBirthdate:(NSDate *)birthdate toNowDate:(NSDate *)nowDate
{
    NSInteger ageResult = 0;
    
    NSCalendar *calendar = [BIUtilDate getCurrentCalendar];
    NSDateComponents *ageDateComponents = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:birthdate toDate:nowDate options:0];
    ageResult = ageDateComponents.year;
    
    return ageResult;
}


+ (NSString *)logDate {
    NSDate *date = [NSDate date];
    NSInteger hour = [BIUtilDate getHourOfDay:date];
    if (hour > 12) {
        hour -= 12;
    }
    
    NSInteger min = [BIUtilDate getMinute:date];
    NSInteger second = [BIUtilDate getSecond:date];
    return  [NSString stringWithFormat:@"%02ld:%02ld:%02ld ", (long)hour, (long)min, (long)second];
}

@end