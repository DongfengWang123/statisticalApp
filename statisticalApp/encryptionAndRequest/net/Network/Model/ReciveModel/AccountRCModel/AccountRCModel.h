//
//  AccountRCModel.h
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface AccountRCModel : BaseModel

@property(nonatomic,strong)NSNumber *totalIncome;          //累计收益
@property(nonatomic,strong)NSNumber *expectCapital;        //待收本金
@property(nonatomic,strong)NSNumber *expectInterest;       //待收收益
@property(nonatomic,strong)NSNumber *awaitPayCount;        //待付订单
@property(nonatomic,strong)NSNumber *awaitPayAmount;       //待付金额

@end
