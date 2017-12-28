//
//  UpdatePasswordRQModel.h
//  longeapp
//
//  Created by zds on 16/5/13.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface UpdatePasswordRQModel : BaseModel

//[pshttp addParameters:[PSGeneral getLocalData:@"memberId"] forKey:@"memberId"];//会员ID
//[pshttp addParameters:_vOldPsw forKey:@"oldPwd"];//原密码
//[pshttp addParameters:_vNewPsw forKey:@"newPwd"];//新密码

///会员ID
@property(nonatomic,copy)NSString *memberId;

///原密码
@property(nonatomic,copy)NSString *oldPwd;

///新密码
@property(nonatomic,copy)NSString *nowPwd;
@end
