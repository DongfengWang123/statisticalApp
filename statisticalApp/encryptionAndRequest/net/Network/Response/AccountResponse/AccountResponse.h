//
//  AccountResponse.h
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountRCModel.h"
@interface AccountResponse : NSObject

+(AccountRCModel *)analysisFromDicToModel:(id)model;

@end
