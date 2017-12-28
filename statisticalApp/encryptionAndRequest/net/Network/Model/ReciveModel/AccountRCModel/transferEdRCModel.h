//
//  transferEdRCModel.h
//  longeapp
//
//  Created by zds on 16/5/26.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface transferEdRCModel : BaseModel

///转让申请id
@property(nonatomic,copy)NSString *transferAppliId;

///项目名称
@property(nonatomic,copy)NSString *productNm;

///转让债权金额
@property(nonatomic,copy)NSString *amountF;

///成交金额
@property(nonatomic,copy)NSString *dealAmountF;

///总份数
@property(nonatomic,strong)NSNumber *quantity;

///当前剩余份数
@property(nonatomic,strong)NSNumber *nowStock;

///购买人数
@property(nonatomic,strong)NSNumber *buyMemberCnt;

///已收本息
@property(nonatomic,copy)NSString *alreadyInAmtF;

///未收本息
@property(nonatomic,copy)NSString *noInAmtF;

///转让状态
@property(nonatomic,strong)NSNumber *transferStatus;

///转让状态名称
@property(nonatomic,copy)NSString *transferStatusNm;



@end
