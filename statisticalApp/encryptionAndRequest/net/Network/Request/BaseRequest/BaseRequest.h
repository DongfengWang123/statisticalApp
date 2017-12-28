//
//  BaseRequest.h
//  CSRequest
//
//  Created by zds on 16/4/12.
//  Copyright © 2016年 zds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface BaseRequest : NSObject

///实例化请求类
+(instancetype)request;

#pragma mark --POST 请求
/**
 *AFNetWork POST 请求(成功类型返回根模型)
 *Url:请求地址
 *RQModel:请求参数模型
 *suc:成功回调（返回模型）
 *failed:失败回调(返回字符串)
 */
-(void)PostSpecialRequest:(NSString *)Url withRQModel:(id)RQModel withSucess:(void(^)(NSDictionary *dic))succ withFailed:(void(^)(NSString *error, int status))failed;


#pragma mark --GET 请求
/**
 *AFNetWork GET 请求(成功类型返回根模型)
 *Url:请求地址
 *RQModel:请求参数模型
 *suc:成功回调（返回模型）
 *failed:失败回调(返回字符串)
 */
-(void)GetRequest:(NSString *)Url withRQModel:(id)RQModel withSucess:(void(^)(BaseModel *baseModel))succ withFailed:(void(^)(NSString *error))failed;


#pragma mark --GET 特殊请求返回字典
/**
 *AFNetWork GET 请求(成功类型返回根模型)
 *Url:请求地址
 *RQModel:请求参数模型
 *suc:成功回调（返回模型）
 *failed:失败回调(返回字符串)
 */
-(void)GetSpecialRequest:(NSString *)Url withRQModel:(id)RQModel withSucess:(void(^)(NSString *dic))succ withFailed:(void(^)(NSString *error))failed;
#pragma mark --文件请求下载
/**
 *AFNetWork GET 请求(用于请求文件下载返回NSDATA)
 *Url:请求地址
 *suc:成功回调（返回NSDATA）
 *failed:失败回调(返回字符串)
 */
-(void)GetFileRequest:(NSString *)Url withSucc:(void(^)(id responseObject))succ withFailed:(void(^)(NSString *error))failed;
@end
