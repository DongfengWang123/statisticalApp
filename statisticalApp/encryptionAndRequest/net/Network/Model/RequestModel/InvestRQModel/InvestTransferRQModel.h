//
//  InvestTransferRQModel.h
//  longeapp
//
//  Created by zds on 16/5/19.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface InvestTransferRQModel : BaseModel

///债权转让id
@property(nonatomic,copy)NSString *transferApplyId;

///购买数量
@property(nonatomic,copy)NSString *buyingQuantity;

///会员ID
@property(nonatomic,copy)NSString *memberId;

///购买产品ID(可以选择使用)
@property(nonatomic,copy)NSString *productId;

///短信验证码
@property(nonatomic,copy)NSString *mobileCode;

@end
