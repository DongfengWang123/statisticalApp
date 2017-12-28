//
//  HelpCenterRQModel.h
//  longeapp
//
//  Created by zds on 16/5/9.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface HelpCenterRQModel : BaseModel

///页码
@property(nonatomic,copy)NSString *currentPage;

///每页条数
@property(nonatomic,copy)NSString *pageSize;

///公告code
@property(nonatomic,copy)NSString *channelCode;

@end
