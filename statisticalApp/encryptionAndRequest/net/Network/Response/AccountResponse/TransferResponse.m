//
//  TransferResponse.m
//  longeapp
//
//  Created by zds on 16/5/26.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "TransferResponse.h"

@implementation TransferResponse

+(NSArray *)transferEnableResponse:(id)model
{
    return [TransferEnableRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

+(NSArray *)transferEdResponse:(id)model
{
    return [transferEdRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

+(NSArray *)transferBuyResponse:(id)model
{
    return [TransferBuyRCModel transformModelAddArray:[[model valueForKey:@"data"] valueForKey:@"records"]];
}

+(checkTransferRCModel *)checkTransferResponse:(id)model
{
    return [checkTransferRCModel transformModel:[model valueForKey:@"data"]];
}
@end
