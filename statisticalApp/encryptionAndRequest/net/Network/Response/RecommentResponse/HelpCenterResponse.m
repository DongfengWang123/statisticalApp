//
//  HelpCenterResponse.m
//  longeapp
//
//  Created by zds on 16/5/9.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "HelpCenterResponse.h"

@implementation HelpCenterResponse

+(NSArray *)analysisArray:(id)model
{
    return [HelpCenterRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

@end
