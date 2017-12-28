//
//  InvestDirectRQModel.h
//  longeapp
//
//  Created by zds on 16/5/18.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface InvestDirectRQModel : BaseModel

///会员ID
@property(nonatomic,copy)NSString *memberId;

///直投项目ID
@property(nonatomic,copy)NSString *productId;

///购买数量
@property(nonatomic,copy)NSString *quantity;

///购买金额
@property(nonatomic,copy)NSString *amount;

///验证码
@property(nonatomic,copy)NSString *vCode;

@end
