//
//  MyMsgRCModel.h
//  longeapp
//
//  Created by zds on 16/5/13.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface MyMsgRCModel : BaseModel

@property(nonatomic,copy)NSString *noticeId;          //消息ID
@property(nonatomic,copy)NSString *title;       //消息标题
@property(nonatomic,copy)NSString *content;     //消息内容
@property(nonatomic, strong)NSNumber *msgReaded;   //是否已读（0=未读，1=已读）

@end
