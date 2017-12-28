//
//  DirectinvestResponse.m
//  longeapp
//
//  Created by zds on 16/5/5.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "DirectinvestResponse.h"

#import "DirectInvestRCModel.h"


@implementation DirectinvestResponse

+(NSArray *)analysisArray:(id)model
{
    return [DirectInvestRCModel transformModelAddArray:[[model valueForKey:@"data"] objectForKey:@"records"]];
}

@end
