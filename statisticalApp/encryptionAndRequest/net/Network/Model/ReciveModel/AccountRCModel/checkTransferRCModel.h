//
//  checkTransferRCModel.h
//  longeapp
//
//  Created by zds on 16/5/27.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface checkTransferRCModel : BaseModel

///转让最小份数
@property(nonatomic,strong)NSNumber *minTenderQuantity;

///项目名称
@property(nonatomic,copy)NSString *productNm;

///债权ID
@property(nonatomic,copy)NSString *creditRightId;

///可转让债权金额
@property(nonatomic,strong)NSNumber *creditAmt;

///债权份数
@property(nonatomic,strong)NSNumber *creditQuantity;

///债权单价
@property(nonatomic,strong)NSNumber *creditPrice;

///转让有效期
@property(nonatomic,copy)NSString *expTimeStr;

///债权转让前应记利息的天数
@property(nonatomic,strong)NSNumber *accruedDayCnt;

///是否可拆分转让 0-不可拆分 1-可拆分
@property(nonatomic,strong)NSNumber *isCanSplitTransfer;

///服务费率
@property(nonatomic,strong)NSNumber *transFeeRate;

///是否通过天计算费率 0-不是 1-是
@property(nonatomic,strong)NSNumber *isByDayCalFee;

///已经持有的天数
@property(nonatomic,strong)NSNumber *alreadyHoldDayCnt;

///最小折扣率
@property(nonatomic,strong)NSNumber *minDisCount;

///最大折扣率
@property(nonatomic,strong)NSNumber *maxDiscount;

///当前总利息
@property(nonatomic,strong)NSNumber *totalInterestAmt;

///当前总利息天数
@property(nonatomic,strong)NSNumber *interestCalDayCnt;

@end
