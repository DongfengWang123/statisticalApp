//
//  TransferInvestRCInfoModel.h
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface TransferInvestRCInfoModel : BaseModel

@property(nonatomic,copy)NSString *productId;           //项目ID
@property(nonatomic,copy)NSString *productCd;           //产品编码
@property(nonatomic,copy)NSString *transferAppliId;     //转让ID
@property(nonatomic,copy)NSString *productNm;           //项目名
@property(nonatomic,strong)NSNumber *transferredRate;      //年化利率
@property(nonatomic,strong)NSNumber *quantity;                //转让总份数
@property(nonatomic,strong)NSNumber *nowStock;                //实时库存
@property(nonatomic,strong)NSNumber *unitPrice;            //原产品单价
@property(nonatomic,strong)NSNumber *statusType;                  //债权转让状态码
@property(nonatomic,copy)NSString *statusName;          //债权转让状态名称
@property(nonatomic,strong)NSNumber *transferPrice;        //转让价格
@property(nonatomic,strong)NSNumber *tenderStart;          //投标开始时间
@property(nonatomic,strong)NSNumber *tenderEnd;            //投标结束时间
@property(nonatomic,strong)NSNumber *applicationDate;      ///转让申请时间
@property(nonatomic,strong)NSNumber *nextRepaymentDate;    //下次还款时间
@property(nonatomic,strong)NSNumber *rate;                 //原标利率
@property(nonatomic,copy)NSString *sellingMemberPhone;  //出售人电话
@property(nonatomic,strong)NSNumber *transferDiscount;     //转让折扣
@property(nonatomic,copy)NSString *repayMethodName;     //还款方式名称
@property(nonatomic,strong)NSNumber *minFullQuantity;         //最小满标份数
@property(nonatomic,copy)NSString *companyNm;           //担保机构名称
@property(nonatomic,strong)NSNumber *memberKind;              //融资人类型
@property(nonatomic,copy)NSString *productContent;      //项目介绍
@property(nonatomic,copy)NSString *fundUse;             //资金用途
@property(nonatomic,copy)NSString *repaySource;         //还款来源
@property(nonatomic,copy)NSString *companyDesc;         //企业简介
@property(nonatomic,copy)NSString *guaranteeDesc;       //担保意见
@property(nonatomic,copy)NSString *safeguardDesc;       //保障措施
@property(nonatomic,strong)NSNumber *minTenderQuantity;       //最小投标数量
@property(nonatomic,strong)NSNumber *days;                    //剩余期限
@property(nonatomic,strong)NSNumber *repayMethod;             //还款方式编码


@end
