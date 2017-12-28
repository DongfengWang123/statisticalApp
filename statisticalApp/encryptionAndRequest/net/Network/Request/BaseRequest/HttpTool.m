//
//  HttpTool.m
//  XFBaiSiBuDeJie
//
//  Created by 谢飞 on 16/2/18.
//  Copyright © 2016年 谢飞. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
#import "SHAEncryption.h"
#import "AFHTTPSessionManager.h"
#define openKeyStr @"c67ecba48eb07165"

@implementation HttpTool

#pragma mark --快速初始化请求类
+(instancetype)request
{
    return [[self alloc] init];
}

-(void)post:(NSString *)url parameters:(NSMutableDictionary *)parameters success:(void (^)(id json))success
    failure:(void (^)(NSError *error))failure{
    
    //创建HTTP请求管理类对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
       //需要注意的是,默认提交请求的数据是二进制的,返回格式是JSON
    //声明请求数据的格式
    // AFHTTPRequestSerializer代表二进制数据
    //AFJSONRequestSerializer代表JSON
    //AFPropertyListRequestSerializer 代表XML
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //申明响应的数据为二进制数据
    manager.requestSerializer = [AFJSONRequestSerializer serializer];


    manager.requestSerializer.timeoutInterval=30.0f;
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    // 可接受的返回内容类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/javascript",@"text/html",@"text/plain",nil];

    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];

    // 使用AFNetworking，默认HTTPMethodsEncodingParametersInURI里面包含的只有`GET`, `HEAD`, 和 `DELETE` .不知道情况的情况下使用POST方法的话，会将用户传递的参数放到Body里面，导致服务端JSP通过request.getParameters()获取不到参数。
    manager.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithArray:@[@"POST",@"GET",@"HEAD"]];
    
    NSMutableDictionary*aesDic=[[NSMutableDictionary alloc]initWithDictionary:parameters];
    
    //将字典转化为Json字符串
    NSString*dataStr=[self convertToJsonData:aesDic];
    //需要传入的数据data使用aes128进行加密
    
    
    NSString*shiLiuJinZhiDataStr=[AESCrypt AES128Encrypt:dataStr];
    
    //获取当前时间戳
    NSString*timeStamp=[PSGeneral getNowTimeTimestamp];
    //正式环境的时候安卓为1,IOS为2
    NSString*openId=@"2";
    NSString*openKey=openKeyStr;
    
    //将以上字符串进行拼接成新的字符串,然后进行签名
    NSString*qianMingStr=[NSString stringWithFormat:@"data=%@&openId=2&openKey=%@&timeStamp=%@",shiLiuJinZhiDataStr,openKey,timeStamp];
    //签名前使用SHA1进行加密
    NSString*shaQianMingStr=[SHAEncryption sha1:qianMingStr];
    //SHA1加密后在使用MD5进行加密
    NSString*MD5QianMingStr=[shaQianMingStr MD5];
    
    NSMutableDictionary*endDic=[[NSMutableDictionary alloc]initWithCapacity:0];
    [endDic setValue:shiLiuJinZhiDataStr forKey:@"data"];
    [endDic setValue:openId forKey:@"openId"];
    [endDic setValue:MD5QianMingStr forKey:@"sign"];
    [endDic setValue:timeStamp forKey:@"timeStamp"];
    

    
    [manager POST:url parameters:endDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
                 if ([responseObject isKindOfClass:[NSMutableDictionary class]])
                 {
                     //取出对应的数据
                     NSString*dataStr=responseObject[@"data"];
                     //取出对应的openId
                     NSString*openIdStr=responseObject[@"openId"];
                     //取出对应的sign,秘钥
                     NSString*signStr=responseObject[@"sign"];
                     //取出对应的时间戳
                     NSString*timeStampStr=responseObject[@"timeStamp"];
        
                     //将后台加密后的数据生成一个签名验证,验证通过以后再进行解析,否则就是网络异常
        
                     NSString*backSignStr=[NSString stringWithFormat:@"data=%@&openId=%@&openKey=%@&timeStamp=%@",dataStr,openIdStr,openKeyStr,timeStampStr];
                     //组成的数据先使用sha1进行加密
                     NSString*backSignShaStr=[SHAEncryption sha1:backSignStr];
                     //生成最终的签名字符串(使用MD5进行加密)
                     NSString*backLastSignStr=[backSignShaStr MD5];
        
                     if ([signStr isEqualToString:backLastSignStr])
                     {
        
                         //先进行数据解密
                         NSString*jieMiStr=[AESCrypt  AES128Decrypt:dataStr];
                         NSDictionary*lastDataDic=[self dictionaryWithJsonString:jieMiStr];
        
        
                         NSLog(@"返回的数据结构----%@",jieMiStr);
                         if (lastDataDic!=nil)
                         {
                             success(lastDataDic);
                         }
        
                     }
                 }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
        
        
        
    }];


    
}

// 字典转json字符串方法

-(NSString *)convertToJsonData:(NSMutableDictionary *)dict

{

    NSError *error;

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];

    NSString *jsonString;

    if (!jsonData) {

        NSLog(@"%@",error);

    }else{

        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];

    }

    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];

//    NSRange range = {0,jsonString.length};

    //去掉字符串中的空格

//    [mutStr replaceOccurrencesOfString:@" " withString:@" " options:NSLiteralSearch range:range];

    NSRange range2 = {0,mutStr.length};

    //去掉字符串中的换行符

    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];

    return mutStr;

}
//JSON字符串转化为字典

-(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
//    jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    NSString * str2 = [jsonString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    
//    str2 = [str2 stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    
//    str2 = [str2 stringByReplacingOccurrencesOfString:@"\r" withString:@""];
//    
//     str2 = [str2 stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
