//
//  HelpCenterRCModel.h
//  longeapp
//
//  Created by zds on 16/5/9.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface HelpCenterRCModel : BaseModel

///标题
@property(nonatomic,copy)NSString *title;

///更新数据
@property(nonatomic,copy)NSString *updateTime;

///公告内容
@property(nonatomic,copy)NSString *content;

@end
