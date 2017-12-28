//
//  SafeCenterRCModel.h
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface SafeCenterRCModel : BaseModel

///注册开户认证
@property(nonatomic,copy)NSNumber *certifiedOpenAccount;

///绑定银行卡认证
@property(nonatomic,copy)NSNumber *certifiedBindCard;

///绑定签约授权认证
@property(nonatomic,copy)NSNumber *certifiedBindAccount;

@end
