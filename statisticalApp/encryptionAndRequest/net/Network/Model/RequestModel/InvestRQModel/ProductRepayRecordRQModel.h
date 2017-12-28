//
//  ProductRepayRecordRQModel.h
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface ProductRepayRecordRQModel : BaseModel

///页码
@property(nonatomic,copy)NSString *currentPage;

///每一页条数
@property(nonatomic,copy)NSString *pageSize;

///产品ID
@property(nonatomic,copy)NSString *productId;
@end
