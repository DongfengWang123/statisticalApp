//
//  TransferInvestInfoResponse.h
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransferInvestRCInfoModel.h"

@interface TransferInvestInfoResponse : NSObject

+(TransferInvestRCInfoModel *)analysisFromDicToModel:(id)model;

@end
