//
//  BusinessRecordsRQModel.h
//  longeapp
//
//  Created by zds on 16/5/20.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface BusinessRecordsRQModel : BaseModel

///页码
@property(nonatomic,copy)NSString *currentPage;

///单页条数
@property(nonatomic,copy)NSString *pageSize;

///会员ID
@property(nonatomic,copy)NSString *memberId;
@end
