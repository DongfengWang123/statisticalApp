//
//  TenderingResponse.m
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "TenderingResponse.h"

@implementation TenderingResponse

+(NSArray *)analysisArray:(id)model;
{
    return [TenderingRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}
@end
