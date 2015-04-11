//
//  BIUtilString.h
//  Bike
//
//  Created by Yuki on 4/11/15.
//  Copyright (c) 2015 kyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIUtilString : NSObject

/**
 截取字符串
 @param inputStr 需要填充的字符串
 @param length 长度，一个汉字是2，一个字母是1
 @return NSString 填充完成的字符串
 */
+ (NSString*) clipString:(NSString*)inputStr length:(int )length ;

/**
 判断字串是否为空
 @param str
 @return
 */
+(bool) emptyOrNull:(NSString *)str;

/**
 将string转为int ，异常时返回-1
 @param s 需要转换的字符串
 @return int 值
 */
+(int) toInt:(NSString *)s;

/**
 将string 转为long,异常时返回-1
 @param s
 @return long 值
 */
+(long long) toLong:(NSString *)s;

/**
 将string 转为float,异常时返回-1
 @param s 需要转换的值
 @return 转换后的float 值
 */
+(float) toFloat:(NSString *)s ;

/**
 将string 转为double,异常时返回-1
 @param s 需要转换的字符串
 @return 转换后的dobule 值
 */
+(double) toDouble:(NSString *)s;

/**
 * 校验字符串是否是浮点类型的字符串
 * @param s 需要校验的字符串
 * @return 是否成功
 */
+ (bool ) isValidDigitString:(NSString *)str;

/**
 * 校验字符串是否是整数的字符串
 * @param s 需要校验的字符串
 * @return 是否成功
 */
+ (bool) isValidIntegerString:(NSString *)str;

/**
 取字串小数点前整数
 @param s
 @return 返回的整数
 */
+(NSString *) toIntString:(NSString *)s ;

/**
 将null转为""
 @param str 需要处理的字符串
 @return 处理后的串
 */
+(NSString *) changeNullStr:(NSString *)str ;

/**
 判断字串是否是数字
 @param str
 @return 是 否
 */
+(bool) isNumString:(NSString *)str;

/**
 判断字串是否是数字
 @param str 校验是否 符合密码的格式
 @return 是 否
 */
+(bool) isPassword:(NSString *)str;

/**
 是否是英文
 @param str 校验是否 英文字符串
 @return 是 否
 */
+(bool) isEnString:(NSString *)str ;


/**
 * 是否只有英文或者数字
 *
 * @param str
 * @return
 */
+ (BOOL)isStringOnlyEnOrNum:(NSString *)str;

/**
 是否中文
 @param name
 @return 是 否
 */
+(bool) isValidCN:(NSString *)name;

/**
 字串是否为繁体
 @param name 需要校验的文字
 @return 是 否
 */
+(bool) isValidTWCN:(NSString *)name ;

/**
 首字母是否中文
 @param name
 @return true or false
 */
+(bool) isFirstChCnStr:(NSString *)name ;

/**
 email是否合法
 @param email
 @return true or false
 */
+(bool) isValidEMail:(NSString *)email ;

/**
 输入 的字串不包含特殊字符
 @param string
 @return 不包则返回true 否则 返回 false
 */
+(bool) isConSpeCharacters:(NSString *)str ;

/**
 是否为中国籍，包含港澳台
 @param nationality
 @return 判断国籍是否正确
 */
+(bool) isValidChineseNationality:(NSString *)nationality ;

/**
 邮编是否正确，只验证长度以及是否全为数字
 @param code
 @return YES or NO
 */
+(bool) isValidPostCode:(NSString *)code ;

/**
 验证输入的手机号是否正确 首位为1 第二位为 3|4|5|8
 @param mobile
 @return YES or NO
 */
+(bool) isMobileNumber:(NSString *) mobile;

/**
 验证输入的手机号是否正确 长度为11位，第一个数字是1
 @param mobile
 @return YES or NO
 */
+(bool) isMobileNumber2:(NSString *) mobile;


/**
 * 验证输入的手机号是否正确 长度为11位，第一个数字是1
 手机格式验证     移动：134X(0-8)、135-9、150-1、157X(0-79)(TD)、158-9、182 -4、187（3G4G)、188(3G)、147(数据卡）、178（4G）
 联通：130-2、152、155-6、185-6(3G)、145(数据卡）、176（4G）
 电信：180-1(3G)、189(3G)、133、153、（1349卫通） 、177（4G）
 虚拟运营商：170
 * @param mobile
 * @return
 */
+(bool) isMobileNumberTrue:(NSString *) mobile;

/**
 身份证合法性验证，15位身份证只验证长度
 @param idcard 身份证号
 @return
 */
+(bool) verifyID:(NSString *)idcard ;

/**
 计算18位身份证明后一位
 @param eighteen
 @return 计算出来的最后一位字串
 */
+(NSString *) getVerify:(NSString *)eighteen ;

/**
 验证英文名合法性 符合五种格式中任意一种即可 a/b c| 
 a/b | 
 a b c| 
 a b| 
 a
 @param name
 @return true or false
 */
+(bool) isValidENName:(NSString *)name;


/**
 验证英文名合法性 符合两种格式中任意一种即可 a/b c| a/b
 @param name
 @return
 */
+(bool) isValidENName4Flight:(NSString *)name;

/**
 计算EditText中输入字串的长度(按字节计算)
 @param temp
 @return
 */
+(int) strlen:(NSString *)temp ;

/**
 生日小于等于当前日期
 @param birthday
 @return YES or NO
 */
+(bool) isValidBirthday:(NSString *)birthday;

/**
 证件有效期校验
 @param birthday
 @return
 */
+(bool) isValidCardLimitDate:(NSString *)date;

/**
 获取时间字串并显示成HH:MM
 @param date    不能为空需大于12
 @return
 */
+(NSString *) getTime:(NSString *)date;

/**
 将日期字串转为 2012-3-28
 @param date
 @return
 */
+(NSString *) parseDate:(NSString *)date;

/**
 将年，月，日，时，分，拼成14位长度的字串
 
 @param _year
            年
 @param _month
            月
 @param _day
            日
 @param _hour
            时
 @param _minute
            分
 @return 14位长度的字串
 */
+(NSString *) formatDateStringYear:(int )_year month:(int )_month day:(int )_day hour:(int )_hour minute:(int )_minute;

/**
 将年，月，日拼成一个8位长的字串
 
 @param year
            年
 @param month
            月
 @param day
            日
 @return 8位长的字串
 */
+(NSString *)formatDateString:(int )_year month:(int )_month day:(int )_day;

/**
 时间字符串格式转换 20101001082000 -> 2010-10-01 08:20
 @param timeStr
 @return 格式化后的字符串
 */
+(NSString *) formatDateTimeString:(NSString *)timeStr;

/**
 时间格式转换并截取日期 20101001082000 -> 2010-10-01
 @param timeStr
 @return
 */
+(NSString *) formatDateString:(NSString *)timeStr ;


/**
 处理特殊要求字符串，将顿号换成换行符
 */
+(NSString *) processString:(NSString *)s;

/**
 将字串中换行符(BR)替换成\n,fe替换为 " "
 @param str 需要替换的字符串
 @return 替换成功后的字符串
 */
+(NSString *) formatInfo:(NSString *)str ;

/**
 将str中含有src的替换成aim str与src 不能为空。
 @param str
 @param src
 @param aim
 @return 替换后的字符串
 */
+(NSString *) replaceStr:(NSString *)str src:(NSString *)src aim:(NSString *)aim;

/**
 返现值
 @param giftValue
 @return
 */
+(NSString *) getBackMoneyString:(NSString *)giftValue ;

/**
 获取当前的进度
 @param value 当前的值
 @param minValue 最小值
 @param midvalue 中间值
 @param maxValue 最大值
 @return 当前的进度
 */
+(int) getSeekBarProgress:(int )value minValue:(int )minValue midValue:(int )midValue maxValue:(int )maxValue;

/**
 获取当前的进度
 @param progress 进度
 @param minValue 最小值
 @param midvalue 中间值
 @param maxValue 最大值
 @return 当前的值
 */
+(int) getSeekBarValue:(int )progress minValue:(int )minValue midValue:(int )midValue maxValue:(int )maxValue;

/**
 姓名是否合法 姓名格式 中文|a/b c|a/b
 @param name
 @return YES NO
 */
+(bool) isHaveSymbolForName:(NSString *)name;

/**
 string是否有效
 @param inputStr 输入的字符串
 @return
 */
+(bool) isValidStr:(NSString *)inputStr;

/**
 @param firstStr
 @param secondStr
 @return
 */
+(bool) stringCompare:(NSString *)firstStr secondStr:(NSString *)secondStr;


/**
 根据数组获取当前的date 字符串
 @param sa 数组
 @return 字符串
 */
+(NSString *) getDateMessage:(NSMutableArray *)sa;

/**
 超过四位的字串前两位后加上:
 @param str 原串
 @return 补了字符串
 */
+(NSString *) processTimeStr:(NSString *)str;

/**
 将日期拆分并将年月日存入数组中
 @param date
 @return 返回分割后的数组
 */
+(NSMutableArray *) getDateField:(NSString *)date;

/**
 返回 日期格式 yyyyMMdd
 @param c
 @return 得到指定格式的字符串
 */
+(NSString *) getDateString:(NSDate *)c ;

/**
 将8位的日期字串与4位的时间字串组成14位长的字串
 @param dateStr
 @param timeStr
 @return 格式化后的字符串
 */
+(NSString *) formatDateTimeString:(NSString *)dateStr timeStr:(NSString *)timeStr;

/**
 将年，月，日 ，三个值拼成 YYYY-MM-DD
 @param year
 @param month
 @param day
 @return 拼接后的字符串 YYYY-MM-DD
 */
+(NSString *) dateToStringYear:(int)year month:(int)month day:(int)day;

/**
 将字串中的两个:替换成.
 @param d 需要替换的串
 @return 替换后的字符串
 */
+(NSString *) parseTude:(NSString *)d;


/**
 在srcStr的position位置，插入insertStr
 @param srcStr 原串
 @param insertStr 需要插入的串
 @param position 插入的位置
 @return 返回添加了插入内容的串
 */
+(NSString *) insertSymbolInStrPotion:(NSString *)srcStr insertStr:(NSString *)insertStr position:(int )position ;

/**
 校验yyyyMMdd日期是否合法
 @param date
 @return 八位的年月日
 */
+(bool) isDateRight:(NSString *)date;

/**
 计算yyyyMMdd与yyyyMMdd之间差多少天
 @param dateStr1
 @param dateStr2
 @return 相差的天数
 */
+(NSInteger) calcTwoDate:(NSString *)dateStr1 dateStr2:(NSString *)dateStr2;

/**
 计算yyyyMMddHHmm与yyyyMMddHHmm之间差多少分钟
 @param dateStr1 第一个日期
 @param dateStr2 第二个日期
 @return 计算两个日期相差多少分钟
 */
+(NSInteger) calcTwoDateTime:(NSString *)dateStr1 dateStr2:(NSString *)dateStr2;

/**
 计算两个日期
 @param dateStr1
 @param dateStr2
 @param minusPlus
 @return 计算航班日期的结果
 */
+(NSInteger) calcGlobalTwoTime:(NSString *)dateStr1 dateStr2:(NSString *)dateStr2;

/**
 计算两个String类型的时间之和
 @param time1 第一个时间
 @param time2 第二个时间
 @return int 时间之和
 */
+(int) plusGlobalTwoTime:(NSString *)time1 time2:(NSString *)time2;


/**
 公里转化米
 支持小数
 @param kilometro 需要转换的
 @return 千米转成米
 */
+(NSString *) kilometreToMetre:(NSString *)kilometre;

/**
 米 转化 公里
 最多保留一位小数
 @parm  metre 数字
 @return 
 */
+(NSString *) metreToKilometre:(NSString *)metre;

/**
 字符串的字节数，一个汉字是2个字节
 @string 被检测的字符串
 @return 字节数
 */
+(NSInteger) byteLengthOfString:(NSString *)string ;

#pragma mark 按符号分割字符串

/**
 按符号分割字符串
 @param str 需要分割的字符串
 @param dot 分割的符号
 @return 分割后的数组
 */
+(NSMutableArray *)separatedByDot:(NSString *)str Dot:(NSString *)dot;

#pragma mark 将string list根据符号拼接

/**
 将string list根据符号拼接
 @param list 需要链接的数组
 @param dot 需要连接的符号
 @return NSString 返回的字符串  list1 dot list2 dot 去掉最前面的dot
 */
+(NSString *)splicedByDot:(NSMutableArray *)list Dot:(NSString *)dot;

/**
  判断给定的url 是否图片.png,.gif
 @param urlStr 需要判断的连接
 @return bool 给出校验成功与否
 */
+(bool ) validIsPicture:(NSString *)urlStr;

/**
 获取 png gif 以及 jpeg 格式的字符串数组
 @param content 需要解析的文本内容
 @return NSMutableArray 返回数组
 */
+(NSMutableArray *) capturePictureUrl:(NSString *)content;

/**
 删除身份证中所有非X和非数字的的字符
 @param idCardNo 判断的身份证号码
 */
+ (NSString *) handleWithIdCardNumber:(NSString *)idCardNo;

#pragma mark
#pragma mark 添加处理 double,float类型数据到字符串的方法

/**
 使用double 或者是 float 类型的数据到字符串(如果是 6.00000 转化成 6 ,6.01300 还是转化成 6.013)
 @param decimalfraction 浮点型数据
 */
+ (NSString *) convertMoneyFromDoubleValue:(double )doubleValue;

/**
 价格换算,供页面开发人员调用
 人民币分，转换成界面显示的钱字符串
 @param  rmbCents 价格,int,单位: 分
 @return 价格,NSString,单位: 元
 
 rmbCents = 0, return = @"0"
 rmbCents < 0, return = @""
 rmbCents = 1111111111, return = @"11111111.11"
 rmbCents = 1111111110, return = @"11111111.1"
 rmbCents = 1111111101, return = @"11111111.01"
 */
+ (NSString *) convertRMBDisplayString:(NSInteger)rmbCents;

/**
 价格换算,供页面开发人员调用
 人民币分，转换成界面显示的钱字符串
 @param  rmbCents 价格,int,单位: 分
 @return 价格,NSString,单位: 元
 
 rmbCents = 0, return = @"0"
 rmbCents < 0, return = @""
 rmbCents = 1111111111, return = @"11111111"
 rmbCents = 1111111110, return = @"11111111"
 rmbCents = 1111111101, return = @"11111111"
 rmbCents = 1111111140, return = @"11111111"
 rmbCents = 1111111150, return = @"11111112"
 */
+ (NSString *) convertRMBIntDisplayString:(NSInteger)rmbCents;

/**
 转换价格字符串。直接去掉分和毛的数值，直接在元数值上加1.如果分和毛的数值都为零，则不加1
 @param  rmbCents 价格,int,单位: 分
 @return 价格,NSString,单位: 元

 rmbCents = 0, return = @"0"
 rmbCents < 0, return = @""
 */
+ (NSString *) convertRMBMaxIntDisplayString:(NSInteger)rmbCents;

 
/**
 将字符串缩至特定长度并替换指定字符
 
 @param oldStr 原字符串  length 转换后的长度 replaceStr 被替换的子串 toStr 替换后的子串
 @return NSString* 转换后的字符串
 */
+ (NSString *)convertString:(NSString *)oldStr toLength:(int)length replace:(NSString *)replaceStr to:(NSString *)toStr;

/**
 货币符号转换
 @param NSString *currency 需要转换的货币三字码
 @return NSString* 货币符号
 */
+ (NSString *)changeCurrency:(NSString *)currency;

#pragma mark - 英文名 firstname/midname lastname 区分为3个name

/**
 英文名拆分
 @param lastname/firstname midname
 @return 数组 lastname firstname midname
 */
+(NSMutableArray*)separateEnglishName:(NSString*)englishName;

#pragma mark - 服务编码
/**
 返回普通服务编码类型: GBK
 @param
 @return NSStringEncoding
 */
+(NSStringEncoding)getServerEncode;

/**
 返回特殊服务编码类型: utf-8
 @param
 @return NSStringEncoding
 */
+(NSStringEncoding)getUTF8Encode;

/**
 将char*类型按照gbk编码格式转换为NSString
 @param char*
 @return string
 */
+(NSString *)getStrFromCharArrayByServerEncode:(char *) charArray
                                  encodingCode:(NSStringEncoding) encodingCode;

/**
 将NSdata类型按照给定编码格式转换为NSString
 @param data
 @param encoding
 @return string
 */
+(NSString *)getStrFromNSDataByServerEncode:(NSData *) data
                               encodingCode:(NSStringEncoding) encodingCode;

/**
 将NSString类型按照给定编码格式转换为NSData
 @param string
 @param encoding
 @return data
 */
+(NSData *)getNSDataFromStrByServerEncode:(NSString *) str
                             encodingCode:(NSStringEncoding) encodingCode;

/**
 将char类型按照给定编码格式转换为NSString
 @param char
 @param encoding
 @return string
 */
+(NSString *)getStrFromCharByEncode:(char*) strChar
                               encoding:(NSStringEncoding) encodingCode;

/**
 * 保留一位小数，第二位小数四舍五入.
 * 如果value为非数字，返回0.0
 * @param value
 * @return
 */
+(NSString* )toOneDecimal:(NSString *)value;


/**
 *	@brief	返回传入字符串的拼音首字母
 *
 *	@param 	 	str 传入字符
 *
 *	@return	NSString 首位拼音字母
 */
+(NSString *)firstLatter:(NSString *)str;

/**
 *
 * 功能描述:返回由左右边界括起来的字符串,如果有多个,则只返回第一个
 *
 * @param string
 * @param left
 * @param right
 * @return
 */
+ (NSString *)getTheEnclosedStringFrom:(NSString *)string wiithLeftBand:(NSString *)leftBand rightBand:(NSString *)rightBand;


+ (NSString *)trimXSSString:(NSString *)string;

@end