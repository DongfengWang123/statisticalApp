//
//  SafeCenterResponse.h
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SafeCenterRCModel.h"

@interface SafeCenterResponse : NSObject

+(SafeCenterRCModel *)analysisFromDicToModel:(id)model;

@end
