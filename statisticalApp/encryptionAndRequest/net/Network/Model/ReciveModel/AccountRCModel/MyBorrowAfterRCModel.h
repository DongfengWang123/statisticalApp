//
//  MyBorrowAfterRCModel.h
//  longeapp
//
//  Created by zds on 16/5/12.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface MyBorrowAfterRCModel : BaseModel

@property(nonatomic,assign)int investWay;               //转让标记
@property(nonatomic,copy)NSString *projectName;         //项目名称
@property(nonatomic,strong)NSNumber *borrowAmont;          //借款金额
@property(nonatomic,strong)NSNumber *restoredPrincipal;    //已还本金
@property(nonatomic,strong)NSNumber *restoredInterest;     //已还本息

@end
