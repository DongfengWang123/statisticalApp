//
//  LoginResponse.h
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LoginRCModel.h"

@interface LoginResponse : NSObject

+(LoginRCModel *)analysisFromDicToModel:(id)model;

@end
