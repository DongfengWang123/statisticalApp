//
//  MyRepayWaiteInfoRCModel.h
//  longeapp
//
//  Created by zds on 16/5/12.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface MyRepayWaiteInfoRCModel : BaseModel

@property(nonatomic,strong)NSNumber *investWay;               //转让标记
@property(nonatomic,copy)NSString *projectName;         //项目名称
@property(nonatomic,copy)NSString *periodStr;           //期限进度
@property(nonatomic,strong)NSNumber *borrowAmont;       //借款金额
@property(nonatomic,strong)NSNumber *repayAmount;       //当期应还
@property(nonatomic,strong)NSNumber *repayDate;         //还款日期
@property(nonatomic,copy)NSString *productId;           //项目ID
@property(nonatomic,strong)NSNumber *period;            //还款期数
@property(nonatomic,strong)NSNumber *statusCd;          //还款状态标志
@property(nonatomic,copy)NSString *statusName;          //还款状态名称

@end
