//
//  PageMemberRQModel.h
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface PageMemberRQModel : BaseModel

///页码
@property(nonatomic,copy)NSString *currentPage;

///每页条数
@property(nonatomic,copy)NSString *pageSize;

///会员ID
@property(nonatomic,copy)NSString *memberId;
@end
