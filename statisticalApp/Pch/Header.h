//
//  Header.h
//  statisticalApp
//
//  Created by ybmac on 2017/12/20.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#ifndef Header_h
#define Header_h


///空字符串处理转换为nil
#define NullTransformNil(value) ({id tmp; if ([value isKindOfClass:[NSNull class]]) tmp =nil; else tmp = value; tmp;})


///空字符串处理
#define NullTransformNilNew(value) [value isKindOfClass:[NSNull class]]?nil:value


///接口根地址（正式中转地址-->更换服务器）
//#define baseUrl(jointUrl) [NSString stringWithFormat:@"http://192.168.1.128/index.php/LottInterface_boss/%@",jointUrl]

//外网
#define baseUrl(jointUrl) [NSString stringWithFormat:@"http://cp.daili700.com/index.php/LottInterface_boss/%@",jointUrl]

///1、身份验证
#define verify_Url @"verify?"
//2.设备申请
#define deviceApply_Url @"deviceApply?"
//3.数据统计
#define appStatistics_Url @"appStatistics?"
//4.收入/支出统计
#define ieStatistics_Url @"ieStatistics?"
//5.获取入款申请列表
#define getDepositList_Url @"getDepositList?"
//6.获取出款申请列表
#define getWithdrawalList_Url @"getWithdrawalList?"
//7.获取今日注册列表
#define getRegisterList_Url @"getRegisterList?"
//8.获取用户详情
#define getUserInfo_Url @"getUserInfo?"
//9.获取用户统计
#define getUserStatistical_Url @"getUserStatistical?"

#endif /* Header_h */
