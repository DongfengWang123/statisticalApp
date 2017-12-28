//
//  TransferEnableRCModel.h
//  longeapp
//
//  Created by zds on 16/5/26.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface TransferEnableRCModel : BaseModel

///债权ID 唯一标识
@property(nonatomic,copy)NSString *creditRightId;

///项目名
@property(nonatomic,copy)NSString *productNm;

///债权本金
@property(nonatomic,copy)NSString *amountF;

///债权份数
@property(nonatomic,strong)NSNumber *quantity;

///年利率
@property(nonatomic,strong)NSNumber *rateP;

///剩余期数
@property(nonatomic,strong)NSNumber *surplusPeriod;

///有效期
@property(nonatomic,copy)NSString *expTimeStr;

@end
