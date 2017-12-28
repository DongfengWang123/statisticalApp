//
//  TransferInvestRQModel.h
//  longeapp
//
//  Created by zds on 16/5/9.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface TransferInvestRQModel : BaseModel

///页码
@property(nonatomic,copy)NSString *currentPage;

///每页的条数
@property(nonatomic,copy)NSString *pageSize;

@end
