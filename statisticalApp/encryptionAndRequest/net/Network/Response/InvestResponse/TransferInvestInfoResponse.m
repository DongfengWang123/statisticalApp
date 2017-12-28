//
//  TransferInvestInfoResponse.m
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "TransferInvestInfoResponse.h"

@implementation TransferInvestInfoResponse

+(TransferInvestRCInfoModel *)analysisFromDicToModel:(id)model
{
    return [TransferInvestRCInfoModel transformModel:[model valueForKey:@"data"]];
}

@end
