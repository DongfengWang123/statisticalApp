//
//  PSGeneral.m
//  pocketcitymng
//
//  Created by yunfei on 14/12/12.
//  Copyright (c) 2014年 Yun Fei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSGeneral.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>
#import <sys/socket.h>
#import <sys/sockio.h>
#import <sys/ioctl.h>
#import <arpa/inet.h>

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

@interface PSGeneral ()


@end


@implementation PSGeneral



//存储界面间传递参数(内存)
static NSMutableDictionary *Parameters;
//获得所有参数
+(NSDictionary*)getParameters
{
    return Parameters;
}
//获得参数内容
+(id)getParameters:(NSString*)key
{
    return [Parameters objectForKey:key];
}
//存入参数
+(void)setParameters:(id)value forKey:(NSString *)key;
{
    if (Parameters==nil) {
        Parameters = [[NSMutableDictionary alloc]init];
    }
    [Parameters setValue:[value copy] forKey:key];
}

/**
 获得当前日期(年月日)
 **/
+(NSString *)getNowYearDateFormat:(NSString*)dateFormat
{
    NSDate *timer = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:dateFormat];
    //设置时区
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/BeiJing"];
    [formatter setTimeZone:timeZone];
    NSString *timerStr = [formatter stringFromDate:timer];
    return timerStr;
}

//获取当前时间戳有两种方法(以秒为单位)

+(NSString *)getNowTimeTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return timeSp;
    
}
/**
 时间戳转时间(年月日时分)
 **/
+(NSString *)getHourMinuteFromTimestamp:(NSDate*)timeStamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    //设置时区
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/BeiJing"];
    [formatter setTimeZone:timeZone];
    NSString *timerStr = [formatter stringFromDate:timeStamp];
    return timerStr;
}
/**
 获得当前时间(年月日时分秒)
 **/
+(NSString *)getNowTimeSetDateFormat:(NSString*)dateFormat
{
    NSDate *timer = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:dateFormat];
    //设置时区
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/BeiJing"];
    [formatter setTimeZone:timeZone];
    NSString *timerStr = [formatter stringFromDate:timer];
    return timerStr;
}
/**
 时间戳转时间(月日时分)
 **/
+(NSString *)getMonthAndDayFromTimestamp:(NSDate*)timeStamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM月dd日 HH:mm"];
    //设置时区
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/BeiJing"];
    [formatter setTimeZone:timeZone];
    NSString *timerStr = [formatter stringFromDate:timeStamp];
    return timerStr;
}
/**
 时间戳转时间(年月日)
 **/
+(NSString *)getYearMonthAndDayFromTimestamp:(NSDate*)timeStamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    //设置时区
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/BeiJing"];
    [formatter setTimeZone:timeZone];
    NSString *timerStr = [formatter stringFromDate:timeStamp];
    return timerStr;
}

/**
 时间戳转时间(年月)
 **/
+(NSString *)getYearMonthFromTimestamp:(NSDate*)timeStamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY年MM月"];
    //设置时区
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/BeiJing"];
    [formatter setTimeZone:timeZone];
    NSString *timerStr = [formatter stringFromDate:timeStamp];
    return timerStr;
}

/**
 时间戳转时间(年月日时分秒)
 **/
+(NSString *)getTimeFromTimestamp:(NSDate*)timeStamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    //设置时区
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/BeiJing"];
    [formatter setTimeZone:timeZone];
    NSString *timerStr = [formatter stringFromDate:timeStamp];
    return timerStr;
}
/**
 *时间戳转时间(年月日周)
 */
+(NSString *)getWeekFromTimestamp:(NSDate*)timeStamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd EEEE"];
    //设置时区
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/BeiJing"];
    [formatter setTimeZone:timeZone];
    NSString *timerStr = [formatter stringFromDate:timeStamp];
    return timerStr;
}

//传入今天的时间，返回明天的时间
+(NSString *)GetTomorrowDay:(NSDate *)aDate
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:aDate];
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"YYYY/MM/dd"];
    return [dateday stringFromDate:beginningOfWeek];
}



// 获取当前周的周一和周日的时间
+(NSString *)getWeekTime
{
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitDay fromDate:nowDate];
    // 获取今天是周几
    NSInteger weekDay = [comp weekday];
    // 获取几天是几号
    NSInteger day = [comp day];
    
    // 计算当前日期和本周的星期一和星期天相差天数
    long firstDiff,lastDiff;
    //    weekDay = 1;
    if (weekDay == 1)
    {
        firstDiff = -6;
        lastDiff = 0;
    }
    else
    {
        firstDiff = [calendar firstWeekday] - weekDay + 1;
        lastDiff = 8 - weekDay;
    }
    NSLog(@"firstDiff: %ld   lastDiff: %ld",firstDiff,lastDiff);
    
    // 在当前日期(去掉时分秒)基础上加上差的天数
    NSDateComponents *firstDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay  fromDate:nowDate];
    [firstDayComp setDay:day + firstDiff];
    NSDate *firstDayOfWeek = [calendar dateFromComponents:firstDayComp];
    
    NSDateComponents *lastDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay   fromDate:nowDate];
    [lastDayComp setDay:day + lastDiff];
    NSDate *lastDayOfWeek = [calendar dateFromComponents:lastDayComp];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/MM/dd"];
    NSString *firstDay = [formatter stringFromDate:firstDayOfWeek];//周一时间
    NSString *lastDay = [formatter stringFromDate:lastDayOfWeek];//周日时间
    NSLog(@"%@=======%@",firstDay,lastDay);
    
    //NSString *dateStr = [NSString stringWithFormat:@"%@-%@",firstDay,lastDay];//同时返回周一和周日的时间
    
    //
    return firstDay;
    
}

//获取当前月的上一个月份
+ (NSString*)setupRequestMonth
{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/MM"];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *lastMonthComps = [[NSDateComponents alloc] init];
    //    [lastMonthComps setYear:1]; // year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    [lastMonthComps setMonth:-1];
    NSDate *newdate = [calendar dateByAddingComponents:lastMonthComps toDate:currentDate options:0];
    NSString *dateStr = [formatter stringFromDate:newdate];
    NSLog(@"date str = %@", dateStr);
    
    return dateStr;
}


/**
 *
 *
时间戳转化为时间(自定义方式)
 */
+(NSString*)getTimeWithTimestamp:(NSString*)timestamp withFormatterStyle:(NSString*)formatterStr
{
    NSDateFormatter*formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:[formatterStr length]==0?@"YYYY-MM-dd HH:mm:ss":formatterStr];
//    时间戳转化为时间
    NSDate*date=[NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    NSString*dateStr=[formatter stringFromDate:date];
    return dateStr;
}


/**
 *
 *
 时间转化为时间戳(自定义方式)
 */
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    
    
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    
    
    
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    
    
    
    return timeSp;
    
}

//将NSString类型转化为NSdate类型
+(NSDate*)nsstringConversionDateFormat:(NSString*)dateFormat datestring:(NSString*)datestring
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    NSDate *date = [dateFormatter dateFromString:datestring];
    return date;
}
/**
 获得配置文件中的数据
 **/
+(NSString *)getConfig:(NSString*)key
{
    NSString *config = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    NSDictionary *configDic = [[NSDictionary alloc]initWithContentsOfFile:config];
    config = [configDic objectForKey:key];
    return config;
}
/**
 获得本地文件中的数据
 **/
+(id)getLocalData:(NSString*)key
{
    //获取路径对象
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取完整路径
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"localdata.plist"];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:plistPath];
    NSString *str = @"";
    if(dic!=nil){
        str=[dic objectForKey:key];
    }
    return str;
}
/**
 存储数据到本地文件中
 **/
+(void)saveLocalData:(id)value forKey:(NSString*)key
{
    //获取路径对象
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取完整路径
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"localdata.plist"];
    NSMutableDictionary *dictplist = [[[NSMutableDictionary alloc ] initWithContentsOfFile:plistPath] mutableCopy];
    if (dictplist==nil) {//文件不存在则创建文件
        dictplist = [[NSMutableDictionary alloc ]init];
    }
    //设置属性值
    if (value&&key)
    {
         [dictplist setObject:value forKey:key];
    }
   
    //写入文件
    [dictplist writeToFile:plistPath atomically:YES];
}

///**
// 删除本地文件中的数据
// **/
+(id)removeLocalData:(NSString*)key
{
    //获取路径对象
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取完整路径
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"localdata.plist"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    
    if(dic!=nil){
        
         NSString *dd = [dic objectForKey:key];
        if (dd)
        {
            [dic removeObjectForKey:key];
          
            NSLog(@"===========%@",[dic objectForKey:@"memberId"]);
            [dic writeToFile:plistPath atomically:YES];

        }
           }
    return dic;
}

+(id)removeLocalData
{
    //获取路径对象
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取完整路径
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"localdata.plist"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    
    if(dic!=nil){
        
        [dic removeAllObjects];
        [dic writeToFile:plistPath atomically:YES];
        
        }
    return dic;
}

/**
 *正则判断手机号码格式
 *@param mobileNum  手机号码
 *@return BOOL 是否正确
 **/
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,154,157,158,159,181,182,184,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,154,157,158,159,181,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[0147-9]|8[12478])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,177,180,189
     22         */
    NSString * CT = @"^1((33|53|77|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
/**
 *正则判断邮箱地址格式
 *@param email  邮箱地址
 *@return BOOL  是否正确
 **/
+(BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//账号由英文字母和数字组成
+(BOOL)isEnglishAndNum:(NSString*)userAndPasswordStr
{
    BOOL flag;
    if (userAndPasswordStr.length<=0)
    {
        flag=NO;
        return flag;
    }
    
    NSString*str=@"^[A-Za-z0-9]+$";
    NSPredicate *userAndPasswordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [userAndPasswordTest evaluateWithObject:userAndPasswordStr];
}

//判断是否是纯数字
+(BOOL)determineWhetherPureNumbers:(NSString*)numberStr
{
    BOOL flag;
    if (numberStr.length<=0)
    {
        flag=NO;
        return flag;
    }
    NSString*str=@"^[0-9]*$";
    NSPredicate *numberStrTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [numberStrTest evaluateWithObject:numberStr];
}
/**
 *正则判断身份证号码格式
 *@param cardNo 手机号码
 *@return BOOL  是否正确
 **/
+(BOOL)checkIdentityCardNo:(NSString*)cardNo
{
    
    BOOL flag;
    if (cardNo.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:cardNo];
        

}
/**
 *金额数字加入千位分隔符
 *@param  digitString 金额数字
 *@return NSString  带千位分隔符的金额数字
 **/
+ (NSString *)separatedDigitStringWithStr:(NSString *)digitString
{
    NSLog(@"%@", [digitString componentsSeparatedByString:@"."]);
    NSArray *array = [digitString componentsSeparatedByString:@"."];
    digitString=array[0];
    NSString *pointStr=[array[1]description];
    if (digitString.length <= 3) {
        return [NSString stringWithFormat:@"%@%@%@",digitString,@".",pointStr];
    } else {
        NSMutableString *processString = [NSMutableString stringWithString:digitString];
        
        // 1
        int location = (int)processString.length - 3;
        NSMutableArray *processArray = [NSMutableArray array];
        while (location >= 0) {
            NSString *temp = [processString substringWithRange:NSMakeRange(location, 3)];
            
            [processArray addObject:temp];
            if (location < 3 && location > 0)
            {
                NSString *t = [processString substringWithRange:NSMakeRange(0, location)];
                [processArray addObject:t];
            }
            location -= 3;
        }
        //    NSLog(@"processArray = %@",processArray);
        
        // 2
        NSMutableArray *resultsArray = [NSMutableArray array];
        int k = 0;
        for (NSString *str in processArray)
        {
            k++;
            NSMutableString *tmp = [NSMutableString stringWithString:str];
            if (str.length > 2 && k < processArray.count )
            {
                [tmp insertString:@"," atIndex:0];
                [resultsArray addObject:tmp];
            } else {
                [resultsArray addObject:tmp];
            }
        }
        //    NSLog(@"resultsArray = %@",resultsArray);
        
        // 3
        NSMutableString *resultString = [NSMutableString string];
        for (int i = (int)resultsArray.count - 1 ; i >= 0; i--)
        {
            NSString *tmp = [resultsArray objectAtIndex:i];
            [resultString appendString:tmp];
        }
        //    NSLog(@"resultStr = %@",resultString);
        return [NSString stringWithFormat:@"%@%@%@",resultString,@".",pointStr];
    }
}
/**
 *金额数字去除千位分隔符
 *@param  money 带千位分隔符的金额数字
 *@return NSString  去除掉千位分隔符的金额数字
 **/
+(NSString*)getMoney:(NSString*)money{
    
    NSArray *array = [money componentsSeparatedByString:@","];
    NSString *result=@"";
    for (int i=0; i<array.count; i++) {
        result=[result stringByAppendingString:[array[i]description]];
    }
    return result;
}
/**
 *判断字符串是否为空
 *@param string 需要判断的字符串
 *@return BOOL  是否为空
 **/
+(BOOL) isNullString:(NSString *)string {
    if (string == nil || string == NULL || [string isEqualToString:@"<null>"]|| [string isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
/**
 *提示信息
 *@param  str 需要显示的提示信息
 *@return void
 **/
+(void)showInfo:(NSString*)str{
    
   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:str
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
    
   
}



/**
 *  检查银行卡号
 */

+(BOOL) checkCardNo:(NSString*) cardNumber
{

    if(cardNumber.length==0){
        return NO;
    }
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < cardNumber.length; i++){
        c = [cardNumber characterAtIndex:i];
        if (isdigit(c)){
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--){
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo){
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        }
        else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}

+(BOOL)checkEmpty:(id)checkObj{
    
    if (nil == checkObj || [checkObj isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([checkObj isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)checkObj;
        NSString *strWithoutWhitespace = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([@"(null)" isEqualToString:str]){
            return YES;
        }
        if ([strWithoutWhitespace length] == 0) {
            return YES;
        }
    }
    
    if ([checkObj isKindOfClass:[NSArray class]]) {
        NSArray *arr = (NSArray *)checkObj;
        if (!([arr count] > 0)) {
            return YES;
        }
    }
    
    return NO;
}

//将阿拉伯数字改为汉字的大写
+(NSString *)translation:(NSString *)arebic

{   NSString *str = arebic;
    NSArray *arabic_numerals = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chinese_numerals = @[@"壹",@"贰",@"叁",@"肆",@"伍",@"陆",@"柒",@"捌",@"玖",@"零"];
    NSArray *digits = @[@"个",@"拾",@"佰",@"仟",@"万",@"拾",@"佰",@"仟",@"亿",@"拾",@"佰",@"仟",@"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chinese_numerals forKeys:arabic_numerals];
    
    NSMutableArray *sums = [NSMutableArray array];
    for (int i = 0; i < str.length; i ++) {
        NSString *substr = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *a = [dictionary objectForKey:substr];
        NSString *b = digits[str.length -i-1];
        NSString *sum = [a stringByAppendingString:b];
        if ([a isEqualToString:chinese_numerals[9]])
        {
            if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]])
            {
                sum = b;
                if ([[sums lastObject] isEqualToString:chinese_numerals[9]])
                {
                    [sums removeLastObject];
                }
            }else
            {
                sum = chinese_numerals[9];
            }
            
            if ([[sums lastObject] isEqualToString:sum])
            {
                continue;
            }
        }
        
        [sums addObject:sum];
    }
    
    NSString *sumStr = [sums  componentsJoinedByString:@""];
    NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
    NSLog(@"%@",str);
    NSLog(@"%@",chinese);
    return chinese;
}

//获取当前手机的IP地址
+ (NSString *)getIPAddress:(BOOL)preferIPv4
{
    NSArray *searchArray = preferIPv4 ?
    @[ IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6 ] :
    @[ IOS_VPN @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4 ] ;
    
    NSDictionary *addresses = [self getIPAddresses];
    NSLog(@"addresses: %@", addresses);
    
    __block NSString *address;
       [searchArray enumerateObjectsUsingBlock:^(NSString  * key, NSUInteger idx, BOOL * _Nonnull stop)
     {
         address = addresses[key];
         //筛选出IP地址格式
         if([self isValidatIP:address]) *stop = YES;
     } ];
    return address ? address : @"0.0.0.0";
}
//链接上面IP的封装
+ (BOOL)isValidatIP:(NSString *)ipAddress {
    if (ipAddress.length == 0) {
        return NO;
    }
    NSString *urlRegEx = @"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
    
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:urlRegEx options:0 error:&error];
    
    if (regex != nil) {
        NSTextCheckingResult *firstMatch=[regex firstMatchInString:ipAddress options:0 range:NSMakeRange(0, [ipAddress length])];
        
        if (firstMatch) {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            NSString *result=[ipAddress substringWithRange:resultRange];
            //输出结果
            NSLog(@"%@",result);
            return YES;
        }
    }
    return NO;
}
//链接上面IP的封装
+ (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}

//每5个数添加一个逗号进行隔开
+(NSString*)countNumAndChangeformat:(NSString *)num intervalNum:(NSInteger)intervalNum
{
    //注释的方法假如第一个是"0"的时候,会将0默认的删除
//    int count = 0;
//    long long int a = num.longLongValue;//字符串的长度
//    while (a != 0)
//    {
//        count++;
//        a /= 10;//等价于a=a/10
//        NSLog(@",,,,,,,,,,,,,,%lld",a);
//    }
//    NSMutableString *string = [NSMutableString stringWithString:num];
//    NSMutableString *newstring = [NSMutableString string];
//    while (count > intervalNum) {
//        count -= intervalNum;
//        NSRange rang = NSMakeRange(string.length - intervalNum, intervalNum);
//        NSString *str = [string substringWithRange:rang];
//        [newstring insertString:str atIndex:0];
//        [newstring insertString:@"," atIndex:0];
//        [string deleteCharactersInRange:rang];
//    }
//    [newstring insertString:string atIndex:0];
//    
//     NSLog(@"==========%@",newstring);
//    
//    return newstring;
    
    if (num.length<intervalNum)
    {
        return  num;
    }else
    {
        NSString *str = [num substringWithRange:NSMakeRange(num.length%intervalNum, num.length-num.length%intervalNum)];
        NSString *strs = [num substringWithRange:NSMakeRange(0, num.length%intervalNum)];
        for (NSInteger  i =0; i < str.length; i =i+intervalNum)
        {
            NSString *sss = [str substringWithRange:NSMakeRange(i, intervalNum)];
            strs = [strs stringByAppendingString:[NSString stringWithFormat:@",%@",sss]];
        }
        if ([[strs substringWithRange:NSMakeRange(0, 1)] isEqualToString:@","]) {
            strs = [strs substringWithRange:NSMakeRange(1, strs.length-1)];
        }
        return strs;

    }
    
    
   }

//将普通字符串转化为十六进制
+(NSString *)hexStringFromString:(NSString *)string
{
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
        
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];   
    }   
    return hexStr;
}

//将十六进制字符串转化为字符串
+ (NSString *)stringFromHexString:(NSString *)hexString
{
    
    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
    NSLog(@"------字符串=======%@",unicodeString);
    return unicodeString; 
    
    
}

//去掉小数点后面的0
+(NSString*)changeFloat:(NSString*)stringFloat
{
    const char*floatChars=[stringFloat UTF8String];
    NSUInteger length=[stringFloat length];
    NSUInteger zeroLength = 0;
    NSInteger i = length-1;
    for (; i>0; i--)
    {
        if (floatChars[i] == '0'/*0x30*/)
        {
            zeroLength++;
        }else
        {
            if(floatChars[i] == '.')
                i--;
            break;
        }
    }
    
    NSString *returnString;
    if(i == -1) {
        returnString = @"0";
    } else {
        returnString = [stringFloat substringToIndex:i+1];
    }
    return returnString;
}

//获取一个随机整数，范围在[from,to），包括from，不包括to
+(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to-from + 1)));
}

@end
