//
//  AccountMoneyRCModel.h
//  longeapp
//
//  Created by zds on 16/5/19.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface AccountMoneyRCModel : BaseModel

///可用余额
@property(nonatomic,strong)NSNumber *balance;

///冻结余额
@property(nonatomic,strong)NSNumber *frzBalance;

///账户余额
@property(nonatomic,strong)NSNumber *accountBalance;

///可提余额
@property(nonatomic,strong)NSNumber *withdrawBalance;


@end
