//
//  ATransferInvestRQModel.h
//  longeapp
//
//  Created by zds on 16/5/27.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface ATransferInvestRQModel : BaseModel

///债权ID
@property(nonatomic,copy)NSString *creditRightId;

///转让折扣率
@property(nonatomic,copy)NSString *transferDiscount;

///转让价格
@property(nonatomic,copy)NSString *transferPrice;

///转让的份数
@property(nonatomic,copy)NSString *transferQuantity;

@end
