//
//  NoticeRQModel.h
//  longeapp
//
//  Created by zds on 16/5/16.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface NoticeRQModel : BaseModel

@property(nonatomic,copy)NSString *currentPage;

@property(nonatomic,copy)NSString *pageSize;

@property(nonatomic,copy)NSString *channelCode;
@end
