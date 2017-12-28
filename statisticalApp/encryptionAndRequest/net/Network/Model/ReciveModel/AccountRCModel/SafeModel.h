//
//  SafeModel.h
//  longeapp
//
//  Created by zds on 16/5/13.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface SafeModel : BaseModel

@property(nonatomic, copy)NSString *phone;                       //电话号码
@property(nonatomic, copy)NSString *realname;                    //真实姓名
@property(nonatomic, copy)NSString *bankNo;                      //银行卡号
@property(nonatomic, copy)NSString *idCard;                      //身份证号
@property(nonatomic, strong)NSNumber *certifiedPassor;           //是否设置密码
@property(nonatomic, strong)NSNumber *certifiedPhone;            //是否绑定电话
@property(nonatomic, strong)NSNumber *certifiedOpenAccount;      //是否实名认证
@property(nonatomic, strong)NSNumber *certifiedBindCard;         //是否绑定银行卡

@end
