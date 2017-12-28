//
//  HttpTool.h
//  XFBaiSiBuDeJie
//
//  Created by 谢飞 on 16/2/18.
//  Copyright © 2016年 谢飞. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ResErrorCode) {
    
    ResErrorCodeFail = 0, // 失败
    ResErrorCodeSuccess = 1, // 成功
    ResErrorCodeBusiness = 2, // 业务逻辑错误
    ResErrorCodeSystem = 3, // 系统错误
    ResErrorCodePleaseLogin = 4, // 需要登录
    ResErrorCodeNoMoney = 5 ,// 余额不足
    ResErrorCodeNeedYaoQingMa=6,//需要邀请码
    ResErrorCodeQingQiuPingFan=8,//请求过于平凡
    ResErrorCodeJsonError=9,//josn校验异常
    ResErrorCodeShuJuError=10//数据有误
    
};

//"0": "失败",
////        "1": "成功",
////        "2": "业务逻辑错误",
////        "3": "系统错误",
////        "4": "需要登录",
////        "5": "余额不足",
////        "6": "需要邀请码",
////        "8": "请求过于频繁",
////        "9": "JSON检验异常",
////        "10": "数据有误"



@interface HttpTool : NSObject

///实例化请求类
+(instancetype)request;

-(void)post:(NSString *)url parameters:(NSMutableDictionary *)parameters success:(void (^)(id json))success
                                                                  failure:(void (^)(NSError *error))failure;



@end
