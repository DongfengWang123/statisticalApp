//
//  NSString+extention.m
//  CSRequest
//
//  Created by zds on 16/4/13.
//  Copyright © 2016年 zds. All rights reserved.
//

#import "NSString+extention.h"
@implementation NSString (extention)

#pragma mark --通过某种字符切割字符串并返回切割后的字符串数组
-(NSArray *)cutFromStringByCutCode:(NSString *)cutCode
{
    NSArray *cutArray=[self componentsSeparatedByString:cutCode];
    return cutArray;
}
@end
