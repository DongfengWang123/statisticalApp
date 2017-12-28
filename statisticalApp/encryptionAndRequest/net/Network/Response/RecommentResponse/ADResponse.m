//
//  ADResponse.m
//  longeapp
//
//  Created by zds on 16/5/6.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "ADResponse.h"
#import "ADRCModel.h"
@implementation ADResponse

+(NSArray *)analysisArray:(id)model;
{
    return [ADRCModel transformModelAddArray:[model valueForKey:@"data"]];
}

@end
