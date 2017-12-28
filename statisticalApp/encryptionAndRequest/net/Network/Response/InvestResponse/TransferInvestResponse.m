//
//  TransferInvestResponse.m
//  longeapp
//
//  Created by zds on 16/5/9.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "TransferInvestResponse.h"

@implementation TransferInvestResponse

+(NSArray *)analysisArray:(id)model
{
    return [TransferInvestRCModel transformModelAddArray:[[model valueForKey:@"data"] objectForKey:@"records"]];
}

@end
