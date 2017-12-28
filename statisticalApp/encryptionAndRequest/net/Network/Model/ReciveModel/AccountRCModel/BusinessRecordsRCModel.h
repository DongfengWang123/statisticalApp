//
//  BusinessRecordsRCModel.h
//  longeapp
//
//  Created by zds on 16/5/20.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface BusinessRecordsRCModel : BaseModel

///收入支出标志 0-收入 1-支出
@property(nonatomic,copy)NSString *rollInout;

///三方账户号
@property(nonatomic,copy)NSString *accountCd;

///交易名称
@property(nonatomic,copy)NSString *itemTypeNm;

///交易金额
@property(nonatomic,strong)NSNumber *itemAmount;

///及时余额
@property(nonatomic,strong)NSNumber *currentBalance;

///交易时间
@property(nonatomic,copy)NSString *tradeDateStr;

///交易状态
@property(nonatomic,strong)NSNumber *statusNm;

///备注
@property(nonatomic,copy)NSString *remark;

@end
