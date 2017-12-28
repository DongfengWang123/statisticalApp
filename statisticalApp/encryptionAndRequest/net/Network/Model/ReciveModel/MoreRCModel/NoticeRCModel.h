//
//  NoticeRCModel.h
//  longeapp
//
//  Created by zds on 16/5/16.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface NoticeRCModel : BaseModel

@property(nonatomic,copy)NSString *title;       //公告标题
@property(nonatomic,strong)NSNumber *updateTime;  //公告更新时间
@property(nonatomic,copy)NSString *content;     //公告内容

@end
