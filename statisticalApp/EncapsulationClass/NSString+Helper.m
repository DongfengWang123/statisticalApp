//
//  NSString+Helper.m
//  HaveFace
//
//  Created by CGM on 15/11/18.
//  Copyright © 2015年 CGM. All rights reserved.
//

#import "NSString+Helper.h"
@implementation NSString (Helper)

#pragma mark 是否空字符串 不为空返回no,为空返回yes
- (BOOL)isEmptyString {
    if (![self isKindOfClass:[NSString class]]) {
        return YES;
    }else if (self==nil) {
        return YES;
    }else if(!self) {
        // null object
        return TRUE;
    } else if(self==NULL) {
        // null object
        return TRUE;
    } else if([self isEqualToString:@"NULL"]) {
        // null object
        return TRUE;
    }else if([self isEqualToString:@"(null)"]){
        
        return TRUE;
    }else{
        //  使用whitespaceAndNewlineCharacterSet删除周围的空白字符串
        //  然后在判断首位字符串是否为空
        NSString *trimedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([trimedString length] == 0) {
            // empty string
            return TRUE;
        } else {
            // is neither empty nor null
            return FALSE;
        }
    }
}

#pragma mark 判断不包含特殊符号
-(BOOL)isNumAndword{
    NSString *reges = @"^[A-Za-z0-9-.]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reges];
    return [pred evaluateWithObject:self];
}

#pragma mark 判断是否是手机号
- (BOOL)checkTel {
    NSString *regex = @"^((13[0-9])|(14[0-9])|(17[0-9])|(15[0-9])|(18[0-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

#pragma mark 判断是否是邮箱
- (BOOL)isValidateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}


#pragma mark 判断是否是纯数字
- (BOOL)isNumber {
    NSString *emailRegex = @"^[0-9]*$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

#pragma mark 清空字符串中的空白字符
- (NSString *)trimString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark 返回沙盒中的文件路径
+ (NSString *)stringWithDocumentsPath:(NSString *)path {
    NSString *file = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return [file stringByAppendingPathComponent:path];
}

#pragma mark 写入系统偏好
- (void)saveToNSDefaultsWithKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:self forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark 一串字符在固定宽度下，正常显示所需要的高度 method
+ (CGFloat)autoHeightWithString:(NSString *)string Width:(CGFloat)width Font:(NSInteger)font {
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 5;//行间距
    paragraph.paragraphSpacing = 0;//段落间隔
    paragraph.firstLineHeadIndent = 50;//首行缩近
    //绘制属性（字典）
    NSDictionary * dictA = @{NSFontAttributeName:[UIFont systemFontOfSize:font],
                             NSForegroundColorAttributeName:[UIColor greenColor],
                             NSBackgroundColorAttributeName:[UIColor grayColor],
                             NSParagraphStyleAttributeName:paragraph,
                             };

    //大小
    CGSize boundRectSize = CGSizeMake(width, MAXFLOAT);
    
    //调用方法,得到高度
    CGFloat newFloat = [string boundingRectWithSize:boundRectSize
                                            options: NSStringDrawingUsesLineFragmentOrigin
                        | NSStringDrawingUsesFontLeading
                                         attributes:dictA context:nil].size.height;
    return newFloat;
}

#pragma mark 一串字符在一行中正常显示所需要的宽度 method
+ (CGFloat)autoWidthWithString:(NSString *)string Font:(NSInteger)font {
    
    //大小
    CGSize boundRectSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    //绘制属性（字典）
    NSDictionary *fontDict = @{ NSFontAttributeName: [UIFont systemFontOfSize:font]};
    //调用方法,得到高度
    CGFloat newFloat = [string boundingRectWithSize:boundRectSize
                                            options: NSStringDrawingUsesLineFragmentOrigin
                        | NSStringDrawingUsesFontLeading
                                         attributes:fontDict context:nil].size.width;
    return newFloat;
}

+ (NSAttributedString *)makeDeleteLine:(NSString *)string{
    string = [NSString stringWithFormat:@"<html><body style =\"font-size:12px;\"><s><font color=\"#B6B6B6\">%@</font></s></body></html>",string];
    NSAttributedString * attributeString = [[NSAttributedString alloc]initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    return attributeString;
}

+ (NSString *)StringHaveNextLine:(NSArray *)array{
    NSString *lineString;
//    for (NSInteger index = 0; index < array.count; index ++) {
//        ZJPFriendInfoBrandList *infoBrand = array[index];
//        if (index == 0) {
//            lineString = [NSString stringWithFormat:@"%@",infoBrand.brandCNName];
//        }else{
//            lineString = [NSString stringWithFormat:@"%@\n%@",lineString,infoBrand.brandCNName];
//        }
//        
//    }
    return lineString;
}

//把某个事件的时间相对于当前时间转化为刚刚,**分钟以前,**小时以前....等格式
-(NSString*)beforeTheTimeIntoTheCurrentTime
{
    
    NSString*dateStr=@"";
    //    创建时间格式转换器
    NSDateFormatter*formatter=[[NSDateFormatter alloc]init];
    //    设置时间格式(服务器返回的时间格式需要和formatterNSString的时间格式一致)
    NSString*formatterNSString=@"yyyy-MM-dd HH-mm-ss";
    formatter.dateFormat=formatterNSString;
    
    //用时间格式器把指定的时间字符串 转化为相应格式的时间
    NSDate*date=[formatter dateFromString:self];

    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
    NSDate *tomorrow = [[NSDate alloc] init];
     tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    
    NSString * dateString = [[date description] substringToIndex:10];
    //    根据日历判断该事件的时间是否在今天
    if([dateString isEqualToString:todayString])
    {
    //返回 年月日发布的
     formatter.dateFormat = @"yyyy-MM-dd";
            
     NSString*specificDateStr = [formatter stringFromDate:date];

    dateStr=[NSString stringWithFormat:@"%@  今天",specificDateStr];

     }else if([dateString isEqualToString:tomorrowString])
     {
         //返回 年月日发布的
         formatter.dateFormat = @"yyyy-MM-dd";
         
         NSString*specificDateStr = [formatter stringFromDate:date];
         
         dateStr=[NSString stringWithFormat:@"%@  明天",specificDateStr];
     }
    else
    {
        //返回 年月日发布的
        formatter.dateFormat = @"yyyy-MM-dd  EEEE";
        
        dateStr = [formatter stringFromDate:date];
    }
    return dateStr;
}

@end
