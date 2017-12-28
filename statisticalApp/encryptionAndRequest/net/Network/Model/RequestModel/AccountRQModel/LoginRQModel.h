//
//  LoginRQModel.h
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface LoginRQModel : BaseModel
///用户名
@property(nonatomic,copy)NSString *username;

///密码
@property(nonatomic,copy)NSString *password;

@end
