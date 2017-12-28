//
//  TransferRecordResponse.m
//  longeapp
//
//  Created by zds on 16/5/16.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "TransferRecordResponse.h"
#import "TransferRecordRCModel.h"
@implementation TransferRecordResponse

+(NSArray *)TransferRecordsResponse:(id)model
{
     return [TransferRecordRCModel transformModelAddArray:[[model valueForKey:@"data"] objectForKey:@"records"]];
}

@end
