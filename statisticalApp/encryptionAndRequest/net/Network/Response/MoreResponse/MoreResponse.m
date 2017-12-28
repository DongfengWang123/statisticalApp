//
//  MoreResponse.m
//  longeapp
//
//  Created by zds on 16/5/16.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "MoreResponse.h"

@implementation MoreResponse

+(NSArray *)NoticeResponse:(id)model
{
    return [NoticeRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

@end
