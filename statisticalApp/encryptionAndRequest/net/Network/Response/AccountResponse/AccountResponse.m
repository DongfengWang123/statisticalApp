//
//  AccountResponse.m
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "AccountResponse.h"

@implementation AccountResponse

+(AccountRCModel *)analysisFromDicToModel:(id)model
{
    return [AccountRCModel transformModel:[model valueForKey:@"data"]];
}

@end
