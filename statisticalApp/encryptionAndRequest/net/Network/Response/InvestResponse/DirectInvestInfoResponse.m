//
//  DirectInvestInfoResponse.m
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "DirectInvestInfoResponse.h"

@implementation DirectInvestInfoResponse

+(DIrectInvestRCInfoModel *)analysisFromDicToModel:(id)model
{
    return [DIrectInvestRCInfoModel transformModel:[model valueForKey:@"data"]];
}

@end
