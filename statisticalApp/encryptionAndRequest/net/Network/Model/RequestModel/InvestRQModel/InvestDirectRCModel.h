//
//  InvestDirectRCModel.h
//  longeapp
//
//  Created by zds on 16/5/18.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface InvestDirectRCModel : BaseModel

@property(nonatomic,strong)NSNumber *castOrderNum;

///订单ID
@property(nonatomic,copy)NSString *orderId;

@property(nonatomic,strong)NSNumber *selectedOrderNum;
@end
