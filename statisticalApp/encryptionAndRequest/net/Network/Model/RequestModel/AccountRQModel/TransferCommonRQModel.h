//
//  TransferCommonRQModel.h
//  longeapp
//
//  Created by zds on 16/5/26.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface TransferCommonRQModel : BaseModel
///页码
@property(nonatomic,copy)NSString *currentPage;

///每页数据条数
@property(nonatomic,copy)NSString *pageSize;

///会员ID
@property(nonatomic,copy)NSString *memberId;

@end
