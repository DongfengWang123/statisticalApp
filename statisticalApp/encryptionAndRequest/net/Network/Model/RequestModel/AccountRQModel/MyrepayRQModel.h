//
//  MyrepayRQModel.h
//  longeapp
//
//  Created by zds on 16/6/13.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface MyrepayRQModel : BaseModel
@property(nonatomic,copy)NSString *memberId;
@property(nonatomic,copy)NSString *productId;
@property(nonatomic,copy)NSString *period;
@property(nonatomic,copy)NSString *repayTotal;


@end
