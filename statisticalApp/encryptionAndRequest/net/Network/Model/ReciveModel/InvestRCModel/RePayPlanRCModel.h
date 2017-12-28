//
//  RePayPlanRCModel.h
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface RePayPlanRCModel : BaseModel

@property(nonatomic,strong)NSNumber *period;      //还款期数
@property(nonatomic,strong)NSNumber *repayDate;   //还款日期
@property(nonatomic,strong)NSNumber *totalMoney;  //应还本息


@end
