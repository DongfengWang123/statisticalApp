//
//  BaseModel.h
//  CSRequest
//
//  Created by zds on 16/4/11.
//  Copyright © 2016年 zds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
@property(nonatomic,copy)NSString *error;
@property(nonatomic,copy)NSString *msg;
@property(nonatomic,strong)NSNumber *status;
@property(nonatomic,strong)NSDictionary *data;

///实例化一个模型
+(instancetype)model;

///通过字典转换为模型
+(instancetype)transformModel:(NSDictionary *)dic;

///通过模型拼接使用与系统自带网络请求的字符串
+(NSString *)jointParamiter:(id)model;

///通过模型转换成字典
+(NSMutableDictionary *)transformDicFromModel:(id)model;

///通过一个包含字典的数组将数组内的字典转化为模型
+(NSMutableArray *)transformModelAddArray:(NSArray *)array;

@end
