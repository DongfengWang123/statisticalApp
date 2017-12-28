//
//  RepayIngRCModel.h
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface RepayIngRCModel : BaseModel

@property(nonatomic,assign)int investWay;               //转让标记
@property(nonatomic,copy)NSString *projectName;         //项目名称
@property(nonatomic,strong)NSNumber *investAmount;         //投资金额
@property(nonatomic,strong)NSNumber *repossessedTotal;     //已收本息
@property(nonatomic,strong)NSNumber *repossessTotal;       //待收本息



@end
