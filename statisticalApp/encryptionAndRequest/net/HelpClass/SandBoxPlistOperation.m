//
//  SandBoxPlistOperation.m
//  CSRequest
//
//  Created by zds on 16/4/15.
//  Copyright © 2016年 zds. All rights reserved.
//

#import "SandBoxPlistOperation.h"
#import "UserData.h"

@implementation SandBoxPlistOperation

#pragma mark --初始化对象
+(instancetype)operate
{
    return [[self alloc]init];
}

-(void)saveDataToSandBoxPlistFile:(NSString *)keyName withValue:(NSString *)valueStr
{
    NSMutableDictionary *plistDic=[self readSandBoxPlist];
    [plistDic setValue:valueStr forKey:keyName];
    if ([plistDic writeToFile:[UserData shareUserData].dataPlistPath atomically:YES]) {
        NSLog(@"存储数据到沙盒plist文件成功成功");
    }
    
}

-(NSString *)readDataFromSandBoxPlistFile:(NSString *)keyName
{
    NSArray *keyArray=[self readSandBoxPlist].allKeys;
    for (NSString *keyNameA in keyArray) {
        if ([keyName isEqualToString:keyNameA]) {
           return [[self readSandBoxPlist] valueForKey:keyName];
        }
    }
    return @"";
}

#pragma mark --读取沙盒目录中指定的plist文件（公用方法）
-(NSMutableDictionary *)readSandBoxPlist
{
    NSMutableDictionary *plistDic=[[NSMutableDictionary alloc]initWithContentsOfFile:[UserData shareUserData].dataPlistPath];

    return plistDic;
}
@end
