//
//  DIrectInvestRCInfoModel.h
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface DIrectInvestRCInfoModel : BaseModel

@property(nonatomic,copy)NSString *productId;           //项目ID
@property(nonatomic,copy)NSString *productNm;           //项目名
@property(nonatomic,strong)NSNumber *rate;                 //年化收益
@property(nonatomic,strong)NSNumber *awardRate;            //奖励比率
@property(nonatomic,strong)NSNumber *quantity;               //产品总量
@property(nonatomic,strong)NSNumber *castQuantity;           //已投数量
@property(nonatomic,strong)NSNumber *amount;               //借款金额
@property(nonatomic,strong)NSNumber *period;                  //借款期限
@property(nonatomic,strong)NSNumber *periodType;              //期限类别
@property(nonatomic,strong)NSNumber *repayMethod;             //还款方式编码
@property(nonatomic,copy)NSString *repayMethodName;     //还款方式名称
@property(nonatomic,strong)NSNumber *tenderStart;          //投标开始时间
@property(nonatomic,strong)NSNumber *tenderEnd;            //投标结束时间
@property(nonatomic,strong)NSNumber *minTenderQuantity;      //最小投标数量
@property(nonatomic,strong)NSNumber *statusType;              //产品状态
@property(nonatomic,copy)NSString *statusName;          //产品状态描述
@property(nonatomic,copy)NSString *companyNm;           //担保机构名称
@property(nonatomic,strong)NSNumber *promotionType;           //促销类型
@property(nonatomic,strong)NSNumber *unitPrice;            //产品单价
@property(nonatomic,strong)NSNumber *minFullQuantity;        //最小满标数量
@property(nonatomic,strong)NSNumber *memberKind;              //融资人类型
@property(nonatomic,copy)NSString *productContent;      //项目介绍
@property(nonatomic,copy)NSString *fundUse;             //资金用途
@property(nonatomic,copy)NSString *repaySource;         //还款来源
@property(nonatomic,copy)NSString *companyDesc;         //企业简介
@property(nonatomic,copy)NSString *guaranteeDesc;       //担保意见
@property(nonatomic,copy)NSString *safeguardDesc;       //保障措施

@end
