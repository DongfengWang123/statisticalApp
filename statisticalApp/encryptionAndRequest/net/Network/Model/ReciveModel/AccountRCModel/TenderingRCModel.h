//
//  TenderingRCModel.h
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface TenderingRCModel : BaseModel

@property(nonatomic,assign)int investWay;               //转让标记
@property(nonatomic,copy)NSString *projectName;         //项目名称
@property(nonatomic,copy)NSString *businestatus;        //订单状态
@property(nonatomic,strong)NSNumber *investAmtount;        //投资金额
@property(nonatomic,strong)NSNumber *rate;                 //年化利率
@property(nonatomic,copy)NSString *periodTypeName;      //项目期限


@end
