//
//  BaseModel.m
//  CSRequest
//
//  Created by zds on 16/4/11.
//  Copyright © 2016年 zds. All rights reserved.
//

#import "BaseModel.h"
#import "NSArray+extention.h"
#import "Header.h"
@implementation BaseModel

#pragma mark --实例化一个模型
+(instancetype)model
{
    return [[self alloc]init];
}

#pragma mark --通过字典转换为模型
+(instancetype)transformModel:(NSDictionary *)dic
{
    id transfroMModel=[self new];
    
    NSArray *propertyName=[NSArray getProperties:[self class]];
    for (NSString *name in propertyName) {
       
        if ([name isEqualToString:@"statusType"]) {
            [transfroMModel setValue:NullTransformNil(dic[@"status"]) forKey:name];
        }else if ([name isEqualToString:@"idType"]){
            [transfroMModel setValue:NullTransformNil(dic[@"id"]) forKey:name];
        }else if ([name isEqualToString:@"operatorType"]){
            [transfroMModel setValue:NullTransformNil(dic[@"operator"]) forKey:name];
        }
        else
        {
            if (dic[name]) {
                if ([dic[name]isKindOfClass:[NSNull class]]) {
                    [transfroMModel setValue:nil forKey:name];
                }else
                {
                    [transfroMModel setValue:dic[name] forKey:name];
                }
               
            }
        }
    }
    return transfroMModel;
}

#pragma mark --通过模型转换为适合系统使用的字符串
+(NSString *)jointParamiter:(id)model
{
    NSString *paramiterStr=@"";
    if (model!=nil) {
        
        NSArray *propertyName=[NSArray getProperties:[model class]];
        
        for (NSString *key in propertyName) {
            if ([key isEqualToString:@"nowPwd"]) {
                
             paramiterStr=[NSString stringWithFormat:@"%@&newPwd=%@",paramiterStr,[model valueForKey:key]];
                
            }else if ([key isEqualToString:@"NewPwd"])
            {
                 paramiterStr=[NSString stringWithFormat:@"%@&newPwd=%@",paramiterStr,[model valueForKey:key]];
            }
            else if ([key isEqualToString:@"NewPayPwd"])
            {
                paramiterStr=[NSString stringWithFormat:@"%@&newPayPwd=%@",paramiterStr,[model valueForKey:key]];
            }else if ([key isEqualToString:@"myoperator"])
            {
                paramiterStr=[NSString stringWithFormat:@"%@&operator=%@",paramiterStr,[model valueForKey:key]];
            }else if ([key isEqualToString:@"idType"])
            {
                paramiterStr=[NSString stringWithFormat:@"%@&id=%@",paramiterStr,[model valueForKey:key]];
                
            }else if ([key isEqualToString:@"statusType"])
            {
                paramiterStr=[NSString stringWithFormat:@"%@&status=%@",paramiterStr,[model valueForKey:key]];
            }
            
            else
            {
                paramiterStr=[NSString stringWithFormat:@"%@&%@=%@",paramiterStr,key,[model valueForKey:key]];
            }
        }
        if ([paramiterStr isEqualToString:@""]) {
            return paramiterStr;
        }
        paramiterStr=[paramiterStr substringFromIndex:1];
        return paramiterStr;
    }else
    {
        return paramiterStr;
    }
}

#pragma mark --通过模型转换为字典
+(NSMutableDictionary *)transformDicFromModel:(id)model
{
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    
    NSArray *paramiters=[NSArray getProperties:[model class]];
    for (NSString *param in paramiters) {
        [dic setValue:[model valueForKey:param] forKey:param];
    }
    
    return dic;
}

#pragma mark --通过一个包含字典的数组将数组内的字典转化为模型
+(NSMutableArray *)transformModelAddArray:(NSArray *)array
{
    ///初始化新的存储数组
    NSMutableArray *dataArray=[NSMutableArray array];
    for (NSDictionary *dic in array) {
        [dataArray addObject:[self transformModel:dic]];
    }
    return dataArray;
}
@end
