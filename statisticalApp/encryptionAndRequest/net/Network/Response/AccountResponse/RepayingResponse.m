//
//  RepayingResponse.m
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "RepayingResponse.h"

@implementation RepayingResponse

+(NSArray *)analysisArray:(id)model;
{
    return [RepayIngRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

@end
