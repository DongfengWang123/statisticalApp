//
//  PSGeneral.h
//  pocketcitymng
//
//  Created by yunfei on 14/12/12.
//  Copyright (c) 2014年 Yun Fei. All rights reserved.
//
#import <UIKit/UIKit.h>
//移动量修正
#define reviseMove (([[[UIDevice currentDevice] systemVersion] intValue]<7.0)?20:0)
//状态栏高度
#define StatusBarHeigh   (([[[UIDevice currentDevice] systemVersion] intValue]<7.0)?0:20)


@interface PSGeneral : NSObject


//@property NSMutableDictionary *Parameters;
/**
 获得所有参数
 **/
+(NSDictionary*)getParameters;
/**
 获得参数内容
 **/
+(id)getParameters:(NSString*)key;
/**
 存入参数
 **/
+(void)setParameters:(id)value forKey:(NSString *)key;

/**
 获得当前日期(年和月)
 **/
+(NSString *)getNowYearDateFormat:(NSString*)dateFormat;
/**
 获得当前时间(年月日时分秒)
 **/
+(NSString *)getNowTimeSetDateFormat:(NSString*)dateFormat;
/**
 获得当前时间戳(以秒为单位)
 **/
+(NSString *)getNowTimeTimestamp;

/**
 时间戳转时间(月日时分)
 **/
+(NSString *)getMonthAndDayFromTimestamp:(NSDate*)timeStamp;
/**
 时间戳转时间(年月日)
 **/
+(NSString *)getYearMonthAndDayFromTimestamp:(NSDate*)timeStamp;
/**
 时间戳转时间(年月)
 **/
+(NSString *)getYearMonthFromTimestamp:(NSDate*)timeStamp;
/**
 时间戳转时间(年月日时分)
 **/
+(NSString *)getHourMinuteFromTimestamp:(NSDate*)timeStamp;
/**
 时间戳转时间(年月日时分秒)
 **/
+(NSString *)getTimeFromTimestamp:(NSDate*)timeStamp;
/**
 *时间戳转时间(年月日周)
 */
+(NSString *)getWeekFromTimestamp:(NSDate*)timeStamp;

//传入今天的时间，返回明天的时间
+(NSString *)GetTomorrowDay:(NSDate *)aDate;

//获取当前周一和周日的时间
+(NSString *)getWeekTime;

//获取当前月的上一个月份
+(NSString*)setupRequestMonth;

/**
 *
 *
 时间戳转化为时间(自定义方式)
 */
+(NSString*)getTimeWithTimestamp:(NSString*)timestamp withFormatterStyle:(NSString*)formatterStr;

/**
 *
 *
 时间转化为时间戳(自定义方式)
 */
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;


//将NSString类型转化为NSdate类型
+(NSDate*)nsstringConversionDateFormat:(NSString*)dateFormat datestring:(NSString*)datestring;


/**
 获得配置文件中的数据
 **/
+(NSString *)getConfig:(NSString*)key;
/**
 获得本地文件中的数据
 **/
+(id)getLocalData:(NSString*)key;
/**
 存储数据到本地文件中
 **/
+(void)saveLocalData:(id)value forKey:(NSString*)key;

///**
// 删除本地文件中的数据
// **/
+(id)removeLocalData:(NSString*)key;

/**
 删除本地文件中的数据
 **/
+(id)removeLocalData;

/**
 *正则判断手机号码格式
 *@param mobileNum  手机号码
 *@return BOOL 是否正确
 **/
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
/**
 *正则判断邮箱地址格式
 *@param email  邮箱地址
 *@return BOOL  是否正确
 **/
+(BOOL)isValidateEmail:(NSString *)email;

//账号由英文字母和数字组成
+(BOOL)isEnglishAndNum:(NSString*)userAndPasswordStr;

//判断是否是纯数字
+(BOOL)determineWhetherPureNumbers:(NSString*)numberStr;
/**
 *正则判断身份证号码格式
 *@param cardNo 手机号码
 *@return BOOL  是否正确
 **/

+(BOOL)checkIdentityCardNo:(NSString*)cardNo;
/**
 *金额数字加入千位分隔符
 *@param  digitString 金额数字
 *@return NSString  带千位分隔符的金额数字
 **/
+ (NSString *)separatedDigitStringWithStr:(NSString *)digitString;
/**
 *金额数字去除千位分隔符
 *@param  money 带千位分隔符的金额数字
 *@return NSString  去除掉千位分隔符的金额数字
 **/
+(NSString*)getMoney:(NSString*)money;
/**
 *判断字符串是否为空
 *@param string 需要判断的字符串
 *@return BOOL  是否为空
 **/
+(BOOL) isNullString:(NSString *)string;
/**
 *提示信息
 *@param  str 需要显示的提示信息

 **/
+(void)showInfo:(NSString*)str;


/**
 * 判断是否为银行卡号
 */

+(BOOL)checkCardNo:(NSString*) cardNumber;
//判断是否为空
+(BOOL)checkEmpty:(id)checkObj;
//将阿拉伯数字改为汉字的大写
+(NSString *)translation:(NSString *)arebic;

//获取当前手机的IP地址
+ (NSString *)getIPAddress:(BOOL)preferIPv4;
+ (BOOL)isValidatIP:(NSString *)ipAddress;
+ (NSDictionary *)getIPAddresses;

+(NSString *)friendlyTime:(NSString *)datetime;

//每5个数添加一个逗号进行隔开
+(NSString*)countNumAndChangeformat:(NSString *)num intervalNum:(NSInteger)intervalNum;

//将普通字符串转化为十六进制
+(NSString *)hexStringFromString:(NSString *)string;

//将十六进制字符串转化为字符串
+ (NSString *)stringFromHexString:(NSString *)hexString;

//去掉小数点后面的0
+(NSString*)changeFloat:(NSString*)stringFloat;

////获取一个随机整数，范围在[from,to），包括from，不包括to
+(int)getRandomNumber:(int)from to:(int)to;

@end


