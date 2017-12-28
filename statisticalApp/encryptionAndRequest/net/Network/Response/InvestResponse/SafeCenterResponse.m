//
//  SafeCenterResponse.m
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "SafeCenterResponse.h"

@implementation SafeCenterResponse

+(SafeCenterRCModel *)analysisFromDicToModel:(id)model
{
    return [SafeCenterRCModel transformModel:[model valueForKey:@"data"]];
}

@end
