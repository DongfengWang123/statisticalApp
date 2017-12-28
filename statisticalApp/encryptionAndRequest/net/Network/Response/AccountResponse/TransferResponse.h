//
//  TransferResponse.h
//  longeapp
//
//  Created by zds on 16/5/26.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TransferEnableRCModel.h"

#import "transferEdRCModel.h"

#import "TransferBuyRCModel.h"

#import "checkTransferRCModel.h"

@interface TransferResponse : NSObject

///可转让债权拼装数据
+(NSArray *)transferEnableResponse:(id)model;

///转让的债权的拼接数据
+(NSArray *)transferEdResponse:(id)model;

///购买的债权拼装数据
+(NSArray *)transferBuyResponse:(id)model;

///查看债权转让记录
+(checkTransferRCModel *)checkTransferResponse:(id)model;

@end
