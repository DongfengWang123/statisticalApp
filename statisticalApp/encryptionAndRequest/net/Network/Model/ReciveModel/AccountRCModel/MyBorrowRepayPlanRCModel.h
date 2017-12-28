//
//  MyBorrowRepayPlanRCModel.h
//  longeapp
//
//  Created by zds on 16/5/12.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface MyBorrowRepayPlanRCModel : BaseModel

@property(nonatomic,strong)NSNumber *investWay;               //转让标记
@property(nonatomic,copy)NSString *projectName;         //项目名称
@property(nonatomic,copy)NSString *repayPeroidStr;      //还款进度
@property(nonatomic,strong)NSNumber *borrowAmont;          //借款金额
@property(nonatomic,strong)NSNumber *restoredTotal;        //已还本息
@property(nonatomic,strong)NSNumber *restoreTotal;         //待还本息

@end
