//
//  MyRepayEdRCModel.h
//  longeapp
//
//  Created by zds on 16/5/13.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface MyRepayEdRCModel : BaseModel

@property(nonatomic,strong)NSNumber *investWay;               //转让标记
@property(nonatomic,copy)NSString *projectName;         //项目名称
@property(nonatomic,copy)NSString *periodStr;           //期限进度
@property(nonatomic,strong)NSNumber *borrowAmont;          //借款金额
@property(nonatomic,strong)NSNumber *repayAmount;          //当期已还
@property(nonatomic,strong)NSNumber *repayDate;            //还款日期

@end
