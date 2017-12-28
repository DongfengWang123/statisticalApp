//
//  RePayPlanRQModel.h
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface RePayPlanRQModel : BaseModel

//[pshttp addParameters:[NSString stringWithFormat:@"%d", 1] forKey:@"currentPage"];
//[pshttp addParameters:@"10" forKey:@"pageSize"];
//[pshttp addParameters:_productId forKey:@"productId"];

///页码
@property(nonatomic,copy)NSString *currentPage;

///每页条数
@property(nonatomic,copy)NSString *pageSize;

///产品ID
@property(nonatomic,copy)NSString *productId;

@end
