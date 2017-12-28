//
//  SecurityCodeRQModel.h
//  longeapp
//
//  Created by zds on 16/5/13.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface SecurityCodeRQModel : BaseModel


@property(nonatomic,copy)NSString *mobile;

@property(nonatomic,copy)NSString *module;

///会员ID （注在金融交易中使用）
@property(nonatomic,copy)NSString *memberId;

///短信类型  （注在金融交易的过程中调用  资金冻结 债权转让  充值  提现）2-资金冻结（投资前调用）6-债权转让(购买债权前调用) 4-充值 5-提现
@property(nonatomic,copy)NSString *smsType;
/***************当为债权转让的时候调用****************/
///项目id
@property(nonatomic,copy)NSString *productCd;

///金额
@property(nonatomic,copy)NSString *amount;
@end
