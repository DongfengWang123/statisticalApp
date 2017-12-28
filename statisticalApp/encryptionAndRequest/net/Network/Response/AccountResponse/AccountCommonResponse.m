//
//  AccountCommonResponse.m
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "AccountCommonResponse.h"


@implementation AccountCommonResponse

+(NSArray *)WaiteReciveMoneyResponse:(id)model;
{
    return [WaiteReciveMoneyRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

+(NSArray *)ReciveMoneyResponse:(id)model;
{
    return [ReciveMoneyRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

+(NSArray *)BorrowAgoPlanResponse:(id)model
{
    return [MyBorrowAgoPlanModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

+(NSArray *)MyBorrowRepayResponse:(id)model
{
    return [MyBorrowRepayPlanRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

+(NSArray *)MyBorrowAfterResponse:(id)model
{
    return [MyBorrowAfterRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

+(NSArray *)MyRepayWaiteInfoResponse:(id)model
{
    return [MyRepayWaiteInfoRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

+(NSArray *)MyRepayEdInfoResponse:(id)model
{
     return [MyRepayEdRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

+(SafeModel *)safeResponse:(id)model
{
    return [SafeModel transformModel:[model valueForKey:@"data"]];
}
+(NSArray *)MyMsgResponse:(id)model
{
    return [MyMsgRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

+(AccountMoneyRCModel *)AccountMoneyResponse:(id)model
{
    return [AccountMoneyRCModel transformModel:[model valueForKey:@"data"]];
}

+(NSArray *)BusinessRecordsResponse:(id)model
{
    return [BusinessRecordsRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

@end
