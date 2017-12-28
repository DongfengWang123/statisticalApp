//
//  MyBorrowAgoPlanModel.h
//  longeapp
//
//  Created by zds on 16/5/12.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface MyBorrowAgoPlanModel : BaseModel

@property(nonatomic,strong)NSNumber *investWay;               //转让标记
@property(nonatomic,copy)NSString *projectName;         //项目名称
@property(nonatomic,copy)NSString *investRate;          //投资进度
@property(nonatomic,strong)NSNumber *borrowAmont;          //借款金额
@property(nonatomic,strong)NSNumber *yearsRate;            //年化利率
@property(nonatomic,copy)NSString *periodStr;           //项目期限

@end
