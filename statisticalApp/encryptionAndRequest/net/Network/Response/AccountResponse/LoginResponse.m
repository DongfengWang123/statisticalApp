//
//  LoginResponse.m
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "LoginResponse.h"

@implementation LoginResponse

+(LoginRCModel *)analysisFromDicToModel:(id)model
{
    return [LoginRCModel transformModel:[model valueForKey:@"data"]];
}

@end
