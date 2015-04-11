//
//  BIUtilString.h
//  Bike
//
//  Created by Yuki on 4/11/15.
//  Copyright (c) 2015 kyu. All rights reserved.
//
//  日期工具类

#import <Foundation/Foundation.h>

typedef enum{
    SIMPLEFORMATTYPE1  = 1,
    SIMPLEFORMATTYPE2  = 2,
    SIMPLEFORMATTYPE3  = 3,
    SIMPLEFORMATTYPE4  = 4,
    SIMPLEFORMATTYPE5  = 5,
    SIMPLEFORMATTYPE6  = 6,
    SIMPLEFORMATTYPE7  = 7,
    SIMPLEFORMATTYPE8  = 8,
    SIMPLEFORMATTYPE9  = 9,
    SIMPLEFORMATTYPE10 = 10,
    SIMPLEFORMATTYPE11 = 11,
    SIMPLEFORMATTYPE12 = 12,
    SIMPLEFORMATTYPE13 = 13,
    SIMPLEFORMATTYPE14 = 14,
    SIMPLEFORMATTYPE15 = 15,
    SIMPLEFORMATTYPE16 = 16,
    SIMPLEFORMATTYPE17 = 17,
    SIMPLEFORMATTYPE18,
}SIMPLEFORMATTYPE;


typedef enum{
    YEAR   = 1,
    MONTH  = 2,
    DAY    = 3,
    HOUR   = 4,
    MINUTE = 5,
    SECOND = 6,
}DATETYPE;

typedef enum {
    eCTStringComparisonResultInvalid = -2,          //非法比较
    eCTStringComparisonResultOrderedAscending = -1, //小于（前后升序）=早于
    eCTStringComparisonResultOrderedSame = 0,       //等于
    eCTStringComparisonResultOrderedDescending = 1, //大于（前后降序）=晚于
} eCTStringComparisonResult;

/** 日期工具类 */
@interface BIUtilDate : NSObject

/**
	时间存储时区，默认GMT+00
	@return 时区字符串
 */
+ (NSString *)storageTimeZone;
/**
 时间显示时区，默认GMT+08
 @return 时区字符串
 */
+ (NSString *)displayTimeZone;

+ (NSString *)SIMPLEFORMATTYPESTRING1;
+ (NSString *)SIMPLEFORMATTYPESTRING2;
+ (NSString *)SIMPLEFORMATTYPESTRING3;
+ (NSString *)SIMPLEFORMATTYPESTRING4;
+ (NSString *)SIMPLEFORMATTYPESTRING5;
+ (NSString *)SIMPLEFORMATTYPESTRING6;
+ (NSString *)SIMPLEFORMATTYPESTRING7;
+ (NSString *)SIMPLEFORMATTYPESTRING8;
+ (NSString *)SIMPLEFORMATTYPESTRING9;
+ (NSString *)SIMPLEFORMATTYPESTRING10;
+ (NSString *)SIMPLEFORMATTYPESTRING11;
+ (NSString *)SIMPLEFORMATTYPESTRING12;
+ (NSString *)SIMPLEFORMATTYPESTRING13;
+ (NSString *)SIMPLEFORMATTYPESTRING14;

/**
 获取当前日期 yyyyMMddHHmmss 14位
 @return 时间字符串
 */
+ (NSString *)getCurrentTime;

/**
 获取当前日期 yyyyMMddHHmmssSSS 17位
 @return 时间字符串
 */
+ (NSString *)getCurrentTimeMillisecond;

/**
 获取当前日期时间 网络通信日志调用 yyyy-MM-dd HH:mm:ss.SSS
 @return 时间字符串
 */
+ (NSString *)getCurrentTimeForCommLog;

/**
 获取当前日期 8位
 @return 时间字符串
 */
+ (NSString *)getCurrentDate;

/**
 获取当前时间的毫秒数
 @return 当前时间的毫秒数
 */
+ (long)getCurrentLongDate;

/**
 获取当前日历
 
 @return 日历
 */
+ (NSCalendar *)getCurrentCalendar;

/**
	获取当前日期格式器
	@return 当前日期格式器
 */
+ (NSDateFormatter *)getCurrentDateFormatter;


/**
 将日期字串转为日期对象,dateStr需超过8位且不能为空,否则返回nil
 
 @param dateStr 日期字符串
 @return 日期对象
 */
+ (NSDate *)getDateByDateStr:(NSString *)dateStr;

/**
 将时间字串转为日期对象，dateStr小于8时返回null，不足14位补0
 
 @param dateStr 日期字符串
 @return 日期对象
 */
+ (NSDate *)getDateByDateTimeStr:(NSString *)dateStr;

/**
 当前日期前一天 yyyyMMdd
 
 @return 日期字符串
 */
+ (NSString *)getLastDate;

/**
 当前日期后一天 yyyyMMdd
 
 @return 日期字符串
 */
+ (NSString *)getNextDate;

/**
 给定日期后一天 yyyyMMdd
 
 @return 日期字符串
 */
+ (NSString *)getNextDate : (NSDate *) date;


/**
 当前日期后两天 yyyyMMdd
 
 @return 日期字符串
 */
+ (NSString *)getAfterNextDate;

/**
 当前日期后三天 yyyyMMdd
 
 @return 日期字符串
 */
+ (NSString *)getThreeDayAfterDate;

/**
 根据日期返回对应的星期，如果date为nil则返回空字串
 
 @param date 日期对象
 @return “星期几”字符串
 */
+ (NSString *)getShowWeekByDate:(NSDate *)date;

/**
 星期几数字索引. 从周日开始，如果date是nil，返回-1
 
 @param date 日期对象
 @return 索引
 */
+ (NSInteger)getWeek:(NSDate *)date;

/**
 返回，今天/明天/后天
 
 @param count 0，1，2 其他则返回空字串
 @return 说明字符串
 */
+ (NSString *)getThreeDayDes:(NSInteger)count;

/**
 获取日期对应的年
 
 @param date 日期对象
 @return 年字段值
 */
+ (NSInteger)getYear:(NSDate *)date;

/**
 获取日期对应的月份
 
 @param date 日期对象
 @return 月字段值
 */
+ (NSInteger)getMonth:(NSDate *)date;
/**
 获取日期对应的DAY
 
 @param date 日期对象
 @return 日字段值
 */
+ (NSInteger)getDay:(NSDate *)date;

/**
 获取日期所在月对应的天数
 
 @param date 日期对象
 @return 天数
 */
+ (NSInteger)getDaysOfMonth:(NSDate *)date;

/**
 获取日期对象对应的小时
 
 @param date 日起对象
 @return 小时
 */
+ (NSInteger)getHourOfDay:(NSDate *)date;

/**
 获取日起对象对应的分钟
 
 @param date 日起对象
 @return 分钟
 */
+ (NSInteger)getMinute:(NSDate *)date;

/**
 获取date对应的秒
 
 @param date 日起对象
 @return 秒
 */
+ (NSInteger)getSecond:(NSDate *)date;

/**
 计算日期字串 DAY字段
 
 @param date 日期字串
 @param step 日期需要加减的天数
 @return 如果date为空或者小于8位则返回""字串,如果step等于0则直接返回date
 */
+ (NSString *)getDateByStep:(NSString *)dateStr
                      step:(int)step;
/**
 对14位的日期对应的字段进行加减计算 并返回yyyyMMddHHmmss
 
 @param date 14位日期字串
 @param field Calendar对应的年、月、日 属性
 @param step 增幅
 @return 计算过后的日期字串 yyyyMMddHHmmss
 */
+ (NSString *)getTimeByStep:(NSString *)dateStr
                     field:(int)field
                      step:(int)step;

/**
 日期加减
 
 @param date 日历
 @param field 要修改的属性
 @param amount 需要加减的值
 @return 修改后的日期对象
 */
+ (NSDate *)calculateCalendar:(NSDate *)date
                        field:(int)field
                       amount:(int)amount;

/**
 dateStr小于8时返回null，不足14位补0 将dateStr 转换成 SimpleDateFormatType对应格式的字串
 
 @param dateStr 原始日期字符串
 @param SimpleDateFormatType 日期格式类型
 @return 日期字符串
 */
+ (NSString *)calendarStrBySimpleDateFormat:(NSString *)dateStr
                       simpleDateFormatType:(int)simpleDateFormatType;

/**
 根据 SimpleDateFormatType类型将calendar转成对应的格式 如果date为null则返回空字符串
 
 @param date 日起对象
 @param SimpleDateFormatType 需要转换的格式类型
 @return 格式化的日期字符串
 */
+ (NSString *)getCalendarStrBySimpleDateFormat:(NSDate *)date
                          simpleDateFormatType:(NSInteger)SimpleDateFormatType;
/**
 根据 NSDate转换成字符格式
 @param date 日期
 @param dateFormat 需要转换的格式类型
 @return 格式化的日期字符串
 */
+ (NSString *)stringOfDate:(NSDate *)date
                dateFormat:(NSString*)dateFormat;
/**
 根据格式把字符串转换成日期
 @param dateString 日期字符串
 @param dateFormat 日期字符串格式
 @return 日期对象
 */
+ (NSDate *)dateOfString:(NSString *)dateString
              dateFormat:(NSString*)dateFormat;

/**
 将yyyyMMdd字符串转成yyyy年M月d日 星期x格式，如果dateStr为空则返回“”
 
 @param dateStr 日期字符串
 @return 格式化日期字符串
 */
+ (NSString *)getShowWeekByDateString:(NSString *)dateStr;

/**
 若日期为今明后天，将yyyyMMdd字符串转成"今天/明天/后天/" 否者，转换成"星期*"
 计算datestr与当前日期相差几天 dDay在3天内则返回相应的今天/明天/后天，否则返回星期*
 @param dateStr 日期字符串
 @return 今天/明天/后天 or 星期*
 */
+ (NSString *)getShowWeek:(NSString *)dateStr;
/**
 *  若日期为今明后天，将yyyyMMdd字符串转成"前天/昨天/今天/明天/后天" 否者，转换成"周*"
 *  如果传入nil，返回空字符串。
 *
 *  @param date 日期对象
 *
 *  @return 前天/昨天/今天/明天/后天 or 周*
 */
+ (NSString *)getAllShowWeek:(NSDate *)date;

/**
 若日期为今明后天，将yyyyMMdd字符串转成"今天/明天/后天/"否则返回空字符串
 @param dateStr 日期字符串
 @return 今天/明天/后天
 */
+ (NSString *)getDateStrCompareToDay:(NSString *)dateStr;

/**
 若日期为今明后天，将yyyyMMdd字符串转成"今天/明天/后天/"否则返回空字符串
 @param dateStr 日期字符串
 @return 今天/明天/后天
 */
+ (NSString *)getDateStrCompareWithToday:(NSString *)dateStr;

/**
 若日期为今明后天，将yyyyMMdd字符串转成"今天/明天/后天/" 否者，转换成"星期*"
 计算datestr与当前日期相差几天 dDay在3天内则返回相应的今天/明天/后天，否则返回星期*
 @param dateStr 日期字符串
 @return 今天/明天/后天 or 星期*
 */
+ (NSString *)getShowWeekStringWithDateStr:(NSString *)dateStr;

/***
 获取两天之间相差多少天(必须是endDate 大于 startDate)
 @param startDate 开始日期
 @param endDate 结束日期
 @return 间隔天数
 */
+ (NSInteger)compareDaysWithStartDate:(NSDate *)startDate
                                endDate:(NSDate *)endDate;

/**
 将yyyyMMdd字符串转成yyyy-MM-dd 星期x格式
 @param dateStr 日期字符串
 @return 格式化日期字符串
 */
+ (NSString *)getShowWeekByDate2:(NSString *)dateStr;

/**
 将yyyyMMdd字符串转成 星期几 或者 节假日
 @param dateStr 日期字符串
 @return 星期几/节假日
 */
+ (NSString *)getShowHolidayOrWeekStr:(NSString *)dateStr;

/**
 将yyyyMMdd字符串转成yyyy-MM-dd
 
 @param dateStr 日期字符串
 @return 格式化日期字符串
 */
+ (NSString *)getShowWeekByDate5:(NSString *)dateStr;

/**
 将yyyyMMddmHHmss字符串转成yyyy-MM-dd
 
 @param dateStr 日期字符串
 @return 格式化日期字符串
 */
+ (NSString *)getShowWeekByDate8:(NSString *)dateStr;

/**
 将yyyyMMdd字符串转成yyyy-MM-dd 今天/明天/后天/星期x格式
 
 @param dateStr 日期字符串
 @return 格式化字符串
 */
+ (NSString *)getShowWeekByDate3:(NSString *)dateStr;

/**
 将yyyyMMdd字符串转成"yyyy-MM-dd [今天/明天/后天]"+"-"+"星期*"+"-"+"节日"
 
 @param dateStr 日期字符串
 @return 格式化字符串
 */
+ (NSString *)getShowWeekByDate4:(NSString *)dateStr;

/**
 将yyyyMMdd字符串转成yyyy年 今天/明天/后天/星期x/节假日 格式
 
 @param dateStr 日期字符串
 @return 格式化字符串
 */
+ (NSString *)getShowWeekByDate6:(NSString *)dateStr;

/**
 将两个日期进行比较，返回两个日期相差的秒数 ，如果有一个日期为nil则返回-1
 
 @param firstDate 第一个日期对象
 @param secondDate 第二个日期对象
 @return 两个日期相差的秒数
 */
+ (long)compareCalendarByLevel:(NSDate *)firstDate
                    secondDate:(NSDate *)secondDate;
/**
 两个日期字串进行比较相差秒数，有一个字串为空则返回-1
 
 @param firstDate 第一个日期
 @param secondDate 第二个日期
 @return 两个long型的差
 */
+ (long)compareDateStringByLevel:(NSString *)firstDateStr
                      secondDate:(NSString *)secondDateStr;

/**
 两个日期字串是否相等
 
 @param firstDate 第一个日期字符串
 @param secondDate 第二个日期字符串
 @return 是否相等
 */
+ (BOOL)dateStringEquls:(NSString *)firstDate
                secondDate:(NSString *)secondDate;

/**
 firstDate是否晚于secondDate
 
 @param firstDate 第一个日期字符串
 @param secondDate 第二个日期字符串
 @return 是否较晚
 */
+ (BOOL)firstDateStrAfterSecondDateStr:(NSString *)firstDate
                               secondDate:(NSString *)secondDate;

/**
 firstDate是否早于secondDate
 
 @param firstDate 第一个日期字符串
 @param secondDate 第二个日期字符串
 @return 是否较早
 */
+ (BOOL)firstDateStrBeforeSecondDateStr:(NSString *)firstDate
                                secondDate:(NSString *)secondDate;
/**
 两个日期 是否相等
 
 @param firstDate 第一个日期对象
 @param secondDate 第二个日期对象
 @return 是否相等
 */
+ (BOOL)firstDateStrEquleSecondDateStr:(NSDate *)firstDate
                               secondDate:(NSDate *)secondDate;
/**
 firstCalendar是否晚于seCalendar
 firstDate > secondDate
 @param firstDate 第一个日期对象
 @param secondDate 第二个日期对象
 @return 是否较晚
 */
+ (BOOL)firstCalendarAfterSecondCalendar:(NSDate *)firstDate
                                 secondDate:(NSDate *)secondDate;

/**
 firstDate是否早于secondDate
 
 @param firstDate 第一个日期对象
 @param secondDate 第二个日期对象
 @return 是否较早
 */
+ (BOOL)firstCalendarBeforeSecondCalendar:(NSDate *)firstDate
                                  secondDate:(NSDate *)secondDate;

/**
 两个日期 是否相等
 
 @param firstDate 第一个日期对象
 @param secondDate 第二个日期对象
 @return 是否相等
 */
+ (BOOL)firstCalendarEquleSecondCalendar:(NSDate *)firstDate
                                 secondDate:(NSDate *)secondDate;

/**
 比较前一个日期是否和后一个日期相等
 @param firstDate 第一个日期对象
 @param secondDate 第二个日期对象
 @return 是否相等
 */
+ (BOOL)firstDateEquleSecondDate:(NSDate *)firstDate
                         secondDate:(NSDate *)secondDate;

/**
 firstDate是否早于secondDate
 
 @param firstDate 第一个日期对象
 @param secondDate 第二个日期对象
 @return 是否较早
 */
+ (BOOL)firstDateLessThanSecondDate:(NSDate *)firstDate
                            secondDate:(NSDate *)secondDate;

/**
 firstDate是否晚于secondDate
 @param firstDate 第一个日期对象
 @param secondDate 第二个日期对象
 @return 是否较晚
 */
+ (BOOL)firstDateAboveThanSecondDate:(NSDate *)firstDate
                             secondDate:(NSDate *)secondDate;

/**
 输入的日期，是否在开始日期和结束日期之间
 @param startDate 开始日期
 @param endDate 结束日期
 @param currendDate 需要判断的日期
 @return 是否在两个日期之间
 */
+ (BOOL) isMiddleDateWithStartDate:(NSDate *)startDate
                                endDate:(NSDate *)endDate
                             middleDate:(NSDate *)currendDate;

/**
 firstDate是否晚于当前日期
 @param firstDate 日起对象
 @return 是否较晚
 */
+ (BOOL)dateCalendarAfterToday:(NSDate *)firstDate;

/**
 firstDate是否等于当前日期
 @param firstDate 日起对象
 @return 是否较等
 */
+ (BOOL)dateCalendarEqulsToday:(NSDate *)firstDate;

/**
 firstDate是否早于当前日期
 @param firstDate 日起对象
 @return 是否较早
 */+ (BOOL)dateCalendarBeforeToday:(NSDate *)firstDate;
/**
 firstDate是否晚于当前日期
 @param firstDate 日起字符串
 @return 是否较晚
 */
+ (BOOL)dateStringAfterToday:(NSString *)firstDateStr;

/**
 firstDate是否早于当前日期
 @param firstDate 日起字符串
 @return 是否较早
 */
+ (BOOL)dateStringBeforeToday:(NSString *)firstDateStr;

/**
 判断传入进来的日期，是否在当前日期之前
 @param firstDateStr 需要和当前日期比较的日期字符串 (yyyyMMddHHmms)
 @return 是否较早
 */
+ (BOOL)getDateStringBeforeToday:(NSString *)firstDateStr;

/**
 firstDate是否等于当前日期
 @param firstDateStr 日起字符串
 @return 是否较等
 */
+ (BOOL)dateStringEqulsToday:(NSString *)firstDateStr;

/**
 农历一年的总天数
 
 @param year 年份
 @return 天数
 */
+ (int)yearDays:(int)year;

/**
 农历某年闰月的天数
 
 @param year 年份
 @return 闰月的天数
 */
+ (int)leapDays:(int)year;

/**
 农历某年闰哪个月1-12，没有闰月返回0
 
 @param year 年份
 @return 闰月份
 */
+ (int)leapMonth:(int)year;

/**
 农历 y年m月的总天数
 
 @param year 年份
 @param month 月份
 @return 天数
 */
+ (int)monthDays:(int)year
           month:(int)month;


/**
 2012-2022 国定节假日
 
 @param dateStr yyyyMMdd格式
 @return 节假日名称，无则返回空串
 */
+ (NSString *)getHolidayString:(NSString *)dateStr;

/**
 将yyyyMMdd字符串转成yyyy年MM月dd日格式
 
 @param dateStr 日期字符串
 @return 格式化字符串
 */
+ (NSString *)getShowStrByDateStr:(NSString *)dateStr;

/**
 格式化日期到字符串
 @param date 待格式化的日期
 @param formate 格式，默认格式yyyy-MM-dd
 @return 格式化字符串
 */
+ (NSString *)dateFormateWithDate:(NSDate *)date
                           formate:(NSString *)formate;

/**
 日期字符串转换为日期对象
 @param str 日期字符串
 @param formate 字符串格式，默认格式yyyy-MM-dd
 @return 日期对象
 */
+ (NSDate *)dateFromString:(NSString *)str
                    formate:(NSString *)formate;

/**
 将字符串时间转换为NSDate对象，支持2种字幅创格式
 @param dateStr 需要格式化的字符串
 @return 生成的日期对象
 */
+ (NSDate *)convertStringToDate:(NSString *)dateStr;

/**
 获取相隔某个时间段的日期
 @param date 基准日期
 @param field 修改属性 
 @param amount 修改增幅值
 @return 修改后的日期对象
 */
+ (NSDate *)calculateDate:(NSDate *)date
                    field:(int)field
                   amount:(int)amount;

/**
 转换 年月日 到 日期 字符串
 @paran year 年
 @param month 月
 @param day 天
 @param hour 小时
 @param minute 分钟
 @param second 秒数
 @return NSString 格式化的日期
 */
+ (NSString *)getDateStringWithYear:(NSInteger)year
                               month:(NSInteger)month
                                 day:(NSInteger)day;
/**
 转换 年 月 日 时 分 秒 到 字符串
 @paran year 年
 @param month 月
 @param day 天
 @param hour 小时
 @param minute 分钟
 @param second 秒数
 @return NSString 格式化的日期
 */
+ (NSString *)getDateStringWithYear:(NSInteger)year
                               month:(NSInteger)month
                                 day:(NSInteger)day
                                hour:(NSInteger)hour
                              minute:(NSInteger)minute
                              second:(NSInteger)second;
/**
 转换 年月日 到 日期
 @paran year 年
 @param month 月
 @param day 天
 @param hour 小时
 @return NSDate 生成日期
 */
+ (NSDate *)getDateWithYear:(NSInteger)year
                       month:(NSInteger)month
                         day:(NSInteger)day;

/**
 转换 年月日时分秒 到 日期
 @paran year 年
 @param month 月
 @param day 天
 @param hour 小时
 @param minute 分钟
 @param second 秒数
 @return 格式化的日期
 */
+ (NSDate *)getDateWithYear:(NSInteger)year
                       month:(NSInteger)month
                         day:(NSInteger)day
                        hour:(NSInteger)hour
                      minute:(NSInteger)minute
                      second:(NSInteger)second;

/**
 获取两天之间相差多少天
 @param startDate 开始日期
 @param endDate 结束日期
 @return 两天相差天数
 */
+ (NSInteger)compareDaysFromStartDate:(NSDate *)startDate
                                endDate:(NSDate *)endDate;

/**
 获取两天之间相差多少分钟
 @param startDate 开始日期
 @param endDate 结束日期
 @return 两天相差分钟数
 */
+ (NSInteger)compareMinutesFromStartDate:(NSDate *)startDate
                                   endDate:(NSDate *)endDate;

/**
 获取两天之间相差多少秒
 @param startDate 开始日期
 @param endDate 结束日期
 @return NSInteger 两天相差秒数
 */
+ (NSInteger)compareSecondFromStartDate:(NSDate *)startDate
                                  endDate:(NSDate *)endDate;

/**
 获取两天之间相差多少天
 @param startDateStr 起始日期字符串
 @param endDateStr 结束日期字符串
 @return 间隔天数
 */
+ (NSInteger)compareDaysFromStartDateStr:(NSString *)startDateStr
                                endDateStr:(NSString *)endDateStr;

/**
 获取两天之间相差多少天
 @param startDateStr 起始日期字符串
 @param endDateStr 结束日期字符串
 @return 间隔天数
 */
+ (NSInteger)compareDaysWithoutABSFromStartDateStr:(NSString *)startDateStr
                              endDateStr:(NSString *)endDateStr;

/** 获取两个日期之间的间隔，包括、年、月日
 @param startDateStr 起始日期字符串 yyyyMMdd
 @param endDateStr 结束日期字符串 yyyyMMdd
 @return 间隔
 */
+ (NSDateComponents*) compareFromDate:(NSString *)startDateStr toDate:(NSString *)endDateStr ;

/**
 *  获取两个日期之间的间隔，包括、年、月、日、小时、分、秒
 *
 *  @param startDateTime  起始日期字符串 yyyyMMddhhmmss
 *  @param endDateTimeStr 结束日期字符串 yyyyMMddhhmmss
 *
 *  @return 间隔
 */
+ (NSDateComponents *)compareFromDateTime:(NSString *)startDateTimeStr toDateTime:(NSString *)endDateTimeStr;

/**
 获取一个月的最后一天
 @param date 任意日期
 @return 当月最后一天日期对象
 */
+ (NSDate *)getLastDateOfMonthWithDate:(NSDate *)date;


/**
	获取一个月的第一天
	@param date 日期对象
	@return 当月第一天日期对象
 */
+ (NSDate *)getFirstDateOfMonthWithDate:(NSDate *)date;

/**
 根据日期返回周几，如果date是nil，返回空字符串
 @param date 需要判断的日期
 @return 星期几
 */
+ (NSString *)getShowWeekByDate1:(NSDate *)date;

/**
 使用NSDate 类型转换成公历的日期
 @param  solarDate 需要转换的日期
 @return NSString 返回 如:春节
 */
+ (NSString *)lunarForSolar:(NSDate *)solarDate;

#pragma mark - ----------2013.6.18后新增方法----------
/**
	比较两个日期字符串先后顺序，若两个日期字符串中有一个长度为0，则返回非法比较。
    字符串位数超过compareLength做裁剪，位数不够做补0
 
	@param firstDateString 第一个时间字符串
	@param secondDateString 第二个时间字符串
	@param compareLength 比较长度
	@return 比较结果
 */
+ (eCTStringComparisonResult)compareDateStringWithFirstDateString:(NSString *)firstDateString secondDateString:(NSString *)secondDateString compareStringLength:(NSUInteger)compareLength;

/**
	比较固定格式的两个日期先后顺序
    如果格式字符串长度为0或者，传入日期为nil，返回比较非法。
 
	@param firstDate 第一个日期
	@param secondDate 第二个日期
	@param dateFormatString 日期格式
	@return 比较结果
 */
+ (eCTStringComparisonResult)compareBetweenDate:(NSDate *)firstDate andDate:(NSDate *)secondDate withFormat:(NSString *)dateFormatString;

/**
    根据生日计算年龄
    如果传入nowDate比生日要早，那么年龄会返回负值。
 
	@param birthdate 生日日期对象
	@return 年龄
 */
+ (NSInteger)calculateAgeWithBirthdate:(NSDate *)birthdate;
/**
	根据生日计算年龄
    如果传入nowDate比生日要早，那么年龄会返回负值。
 
	@param birthdate 生日日期对象
	@param nowDate 计算截止日期对象
	@return 年龄
 */
+ (NSInteger)calculateAgeWithBirthdate:(NSDate *)birthdate toNowDate:(NSDate *)nowDate;

//打印log使用的时间
+ (NSString *)logDate;

@end