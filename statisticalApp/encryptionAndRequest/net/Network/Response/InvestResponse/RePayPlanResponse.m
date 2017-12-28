//
//  RePayPlanResponse.m
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "RePayPlanResponse.h"

@implementation RePayPlanResponse

+(NSArray *)analysisArray:(id)model
{
    return [RePayPlanRCModel transformModelAddArray:[[model valueForKey:@"data"] objectForKey:@"records"]];
}

@end
