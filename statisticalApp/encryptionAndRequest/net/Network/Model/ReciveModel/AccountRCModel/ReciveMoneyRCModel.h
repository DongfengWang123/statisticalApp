//
//  ReciveMoneyRCModel.h
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface ReciveMoneyRCModel : BaseModel

@property(nonatomic,assign)int investWay;               //转让标记
@property(nonatomic,copy)NSString *projectName;         //项目名称
@property(nonatomic,copy)NSString *periodStr;           //期限进度
@property(nonatomic,strong)NSNumber *investAmount;         //投资金额
@property(nonatomic,strong)NSNumber *receiveTotal;         //应收总额
@property(nonatomic,strong)NSNumber *receivableDate;       //收款日期

@end
