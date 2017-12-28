//
//  TransferBuyRCModel.h
//  longeapp
//
//  Created by zds on 16/5/26.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface TransferBuyRCModel : BaseModel

///项目名
@property(nonatomic,copy)NSString *productNm;

///认购债权
@property(nonatomic,copy)NSString *buyCreditAmtF;

///交易金额
@property(nonatomic,copy)NSString *dealCreditAmtF;

///交易时间
@property(nonatomic,copy)NSString *dealCreditTimeStr;

///年化收益
@property(nonatomic,strong)NSNumber *buyCreditRate;

///未收本息
@property(nonatomic,copy)NSString *noInAmtF;

@end
