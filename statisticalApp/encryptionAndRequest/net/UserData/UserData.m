//
//  UserData.m
//  CSRequest
//
//  Created by zds on 16/4/12.
//  Copyright © 2016年 zds. All rights reserved.
//

#import "UserData.h"

static UserData *userdata = nil;

@implementation UserData

#pragma mark --共享单例接口
+(UserData *)shareUserData
{
    if (!userdata)
    {
        userdata = [[self allocWithZone:NULL] init];
    }
    return userdata;
}

#pragma mark --检查是否第一次启动
+(void)checkStartTime
{
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
        [self shareUserData].isFirstOpen=YES;
    }else{
        [self shareUserData].isFirstOpen=NO;
    }
}

@end
