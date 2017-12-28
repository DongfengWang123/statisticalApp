//
//  RegisterRQModel.h
//  longeapp
//
//  Created by zds on 16/5/13.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface RegisterRQModel : BaseModel

@property(nonatomic,copy)NSString *mobile;

@property(nonatomic,copy)NSString *password;

@property(nonatomic,copy)NSString *mCheckCode;

@end
