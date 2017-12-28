//
//  PersonBorrowRQModel.h
//  longeapp
//
//  Created by zds on 16/5/6.
//  Copyright © 2016年 YangHong. All rights reserved.
//

///个人借款请求模型
#import "BaseModel.h"

@interface PersonBorrowRQModel : BaseModel

///会员ID
@property(nonatomic,copy)NSString *memberId;

///借款人名称
@property(nonatomic,copy)NSString *borrowName;

///联系电话
@property(nonatomic,copy)NSString *mobile;

///借款金额
@property(nonatomic,copy)NSString *borrowAmount;

///借款期限
@property(nonatomic,copy)NSString *period;

///借款期限类型  1:天 2:月 4:年 默认为月
@property(nonatomic,copy)NSString *periodType;

///职业
@property(nonatomic,copy)NSString *occupation;

///家庭年收入
@property(nonatomic,copy)NSString *familyIncome;

///借款原因
@property(nonatomic,copy)NSString *borrowReason;

///担保措施描述
@property(nonatomic,copy)NSString *safeguardDesc;

///担保措施
@property(nonatomic,copy)NSString *safeguard;
@end
