//
//  RePayEdResponse.m
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "RePayEdResponse.h"
#import "RepayEdRCModel.h"

@implementation RePayEdResponse

+(NSArray *)analysisArray:(id)model;
{
    return [RepayEdRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

@end
