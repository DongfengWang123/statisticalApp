//
//  DirectInvestRCModel.h
//  longeapp
//
//  Created by zds on 16/5/5.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface DirectInvestRCModel : BaseModel

@property(nonatomic,copy)NSString *productId;           //项目ID
@property(nonatomic,copy)NSString *productNm;           //项目名
@property(nonatomic,strong)NSNumber *rate;              //年化收益
@property(nonatomic,strong)NSNumber *awardRate;         //奖励比率
@property(nonatomic,strong)NSNumber *quantity;          //产品总量
@property(nonatomic,strong)NSNumber *castQuantity;      //已投数量
@property(nonatomic,strong)NSNumber *amount;            //借款金额
@property(nonatomic,strong)NSNumber *period;            //借款期限
@property(nonatomic,strong)NSNumber *periodType;        //期限类别
@property(nonatomic,strong)NSNumber *tenderStart;       //投标开始时间
@property(nonatomic,strong)NSNumber *statusType;        //产品状态
@property(nonatomic,copy)NSString *statusName;          //产品状态描述
@property(nonatomic,copy)NSString *companyNm;           //担保机构名称
@property(nonatomic,strong)NSNumber *promotionType;     //促销类型

@end
