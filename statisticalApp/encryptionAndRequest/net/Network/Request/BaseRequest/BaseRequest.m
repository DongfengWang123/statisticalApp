 //
//  BaseRequest.m
//  CSRequest
//
//  Created by zds on 16/4/12.
//  Copyright © 2016年 zds. All rights reserved.
//

#import "BaseRequest.h"
#import "AFHTTPSessionManager.h"
#import "Header.h"
#import "SHAEncryption.h"
#import "ErrorLoginView.h"
#define openKeyStr @"c67ecba48eb07165"

@interface BaseRequest  ()

@property(nonatomic,strong)ErrorLoginView*errorLoginView;

@end



@implementation BaseRequest

#pragma mark --快速初始化请求类
+(instancetype)request
{
    return [[self alloc] init];
}

#pragma mark --POST请求
-(void)PostSpecialRequest:(NSString *)Url withRQModel:(id)RQModel withSucess:(void(^)(NSDictionary *dic))succ withFailed:(void(^)(NSString *error, int status))failed
{
    
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

    
   // manager.securityPolicy = [self customSecurityPolicy];
    
   // 使用AFNetworking，默认HTTPMethodsEncodingParametersInURI里面包含的只有`GET`, `HEAD`, 和 `DELETE` .不知道情况的情况下使用POST方法的话，会将用户传递的参数放到Body里面，导致服务端JSP通过request.getParameters()获取不到参数。
    manager.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithArray:@[@"POST",@"GET",@"HEAD"]];
    
    NSMutableDictionary*aesDic=[[NSMutableDictionary alloc]initWithDictionary:[BaseModel transformDicFromModel:RQModel]];
 
    
    //为了能够输出请求的参数
    NSString *urlString = [NSString stringWithFormat:@"%@%@",Url,[BaseModel jointParamiter:RQModel]];
    
    
    NSLog(@"url-----%@",urlString);
    
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



    [manager POST:Url parameters:endDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
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
                
                
                
                
                if (lastDataDic!=nil)
                {
                    succ(lastDataDic);
                }
                
            }else
            {
                
                [self createErrorLoginView];
                _errorLoginView.errorContentLabel.text=@"网络异常";
            }
 
        }



        
       
  
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
       
//        [self createErrorLoginView];
//        _errorLoginView.errorContentLabel.text=[NSString stringWithFormat:@"%@",error.domain];
//        failed( error.domain,(int)error.code);
        
       failed(@"网络繁忙 请重试",(int)error.code);
    }];
}

#pragma mark --GET请求
-(void)GetRequest:(NSString *)Url withRQModel:(id)RQModel withSucess:(void (^)(BaseModel *))succ withFailed:(void (^)(NSString *))failed
{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval=30.0;
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",Url,[BaseModel jointParamiter:RQModel]];
    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlString, NULL, NULL,  kCFStringEncodingUTF8 ));
    
    [manager GET:encodedString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        BaseModel *baseModel=[BaseModel transformModel:dic];
        if (dic!=nil) {
            if ([baseModel.status intValue]==0) {
                succ(baseModel);
            }else
            {
                failed(baseModel.msg);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(@"网络繁忙 请重试");
    }];
}

#pragma mark --特殊get请求返回字典类型
-(void)GetSpecialRequest:(NSString *)Url withRQModel:(id)RQModel withSucess:(void (^)(NSString *))succ withFailed:(void (^)(NSString *))failed
{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];//以二进制的方式返回数据
    manager.requestSerializer = [AFJSONRequestSerializer serializer];//以json的形式进行请求
    //设置请求的时间
    manager.requestSerializer.timeoutInterval=10.0;

    //将请求的数据model,转换成字典
     NSMutableDictionary*aesDic=[[NSMutableDictionary alloc]initWithDictionary:[BaseModel transformDicFromModel:RQModel]];
    
    //为了能够输出请求的参数
    NSString *requestUrlString = [NSString stringWithFormat:@"%@%@",Url,[BaseModel jointParamiter:RQModel]];
    
    
   

    
    
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
    
    NSString *urlString = [NSString stringWithFormat:@"%@data=%@&openId=%@&sign=%@&timeStamp=%@",Url,endDic[@"data"],endDic[@"openId"],endDic[@"sign"],endDic[@"timeStamp"]];

    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlString, NULL, NULL,  kCFStringEncodingUTF8 ));
    

    if (encodedString)
    {
        succ(encodedString);
    }
    
//    [manager GET:encodedString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//        
//      
//        
//        if (dic!=nil) {
//            succ(dic);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//       
//        [SVProgressHUD showErrorWithStatus:error.domain];
//    }];
}

#pragma mark --文件操作
-(void)GetFileRequest:(NSString *)Url withSucc:(void (^)(id))succ withFailed:(void (^)(NSString *))failed
{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval=30.0;
    
    [manager GET:Url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succ(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(@"网络繁忙 请重试");
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
    
//    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
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
    
    jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString * str2 = [jsonString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    
    str2 = [str2 stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    str2 = [str2 stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    
//    str2 = [str2 stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSData *jsonData = [str2 dataUsingEncoding:NSUTF8StringEncoding];
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

- (NSString *) stringDeleteString:(NSString *)str
{
    NSMutableString *stringWill = [NSMutableString stringWithString:str];
    for (int i = 0; i < stringWill.length; i++)
    {
        unichar c = [stringWill characterAtIndex:i];
        NSRange range = NSMakeRange(i, 1);
        //需要过滤的字符串
        if (c == ' ' || c == '.'  || c == '(' || c == ')' || c == '\t' || c == '\n' || c == '\r')
        {
            [stringWill deleteCharactersInRange:range];
            --i;
        }
    }
    NSString *stringDelete = [NSString stringWithString:stringWill];
    return stringDelete;
}





-(AFSecurityPolicy *)customSecurityPolicy
{
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"server" ofType:@"crt"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    NSSet *certSet = [NSSet setWithObjects:certData, nil];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = NO;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = YES;
    
    securityPolicy.pinnedCertificates = certSet;
    
    return securityPolicy;
}

//创建错误的提示框
-(void)createErrorLoginView
{
    _errorLoginView=[ErrorLoginView view];
    UIWindow*window=[[UIApplication sharedApplication].delegate window];
    _errorLoginView.frame=window.frame;
    [window addSubview:_errorLoginView];
}

@end
