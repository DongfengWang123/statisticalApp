//
//  TransferInvestRCModel.h
//  longeapp
//
//  Created by zds on 16/5/9.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface TransferInvestRCModel : BaseModel

@property(nonatomic,copy)NSString *transferAppliId;     //转让ID
@property(nonatomic,copy)NSString *productNm;           //项目名
@property(nonatomic,strong)NSNumber *transferredRate;      //年化利率
@property(nonatomic,strong)NSNumber *quantity;                //转让总份数
@property(nonatomic,strong)NSNumber *nowStock;                //实时库存
@property(nonatomic,strong)NSNumber *transferPrice;        //转让价格
@property(nonatomic,strong)NSNumber *period;                  //借款期限
@property(nonatomic,strong)NSNumber *days;                    //剩余期限
@property(nonatomic,strong)NSNumber *periodType;              //期限类别
@property(nonatomic,strong)NSNumber *tenderStart;          //招标开始时间
@property(nonatomic,strong)NSNumber *statusType;                  //债权转让状态码
@property(nonatomic,copy)NSString *statusName;          //债权转让状态名称
@property(nonatomic,copy)NSString *companyNm;           //担保机构名称

@end
