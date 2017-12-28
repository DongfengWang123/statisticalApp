//
//  InvestResponse.m
//  longeapp
//
//  Created by zds on 16/5/18.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "InvestResponse.h"

@implementation InvestResponse

+(InvestDirectRCModel *)dicrectInvestResponse:(id)model
{
    return [InvestDirectRCModel transformModel:[model valueForKey:@"data"]];
}

@end
