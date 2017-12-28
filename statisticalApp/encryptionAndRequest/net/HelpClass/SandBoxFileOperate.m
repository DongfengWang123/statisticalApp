//
//  SandBoxFileOperate.m
//  CSRequest
//
//  Created by zds on 16/4/14.
//  Copyright © 2016年 zds. All rights reserved.
//

#import "SandBoxFileOperate.h"
#import "UserData.h"
#import "BaseRequest.h"
#import "NSString+extention.h"

@implementation SandBoxFileOperate

#pragma mark --初始化对象
+(instancetype)operate
{
    return [[self alloc]init];
}

#pragma mark --缓存文件到指定的沙盒目录
-(void)CacheFileToSandBox:(NSString *)fileUrl withFileData:(NSData *)fileData
{
    NSString *pdfPath=[[UserData shareUserData].fileManagerPath stringByAppendingPathComponent:[self handleStr:fileUrl]];
    NSFileManager *manager=[NSFileManager defaultManager];
    if ([manager createFileAtPath:pdfPath contents:fileData attributes:nil]) {
        NSLog(@"文件存储成功");
    }
}

#pragma mark --从指定的沙盒目录中读取文件
-(void)readFileFromSandBox:(NSString *)fileUrl withSuccData:(void(^)(NSData *data))fileData
{
    if ([self checkFileFromSandBox:fileUrl]) {
        fileData([self commonCheckFile:fileUrl]);
    }else
    {
        [self requestFile:fileUrl withSucc:^(NSData *data) {
            fileData(data);
        } withFailed:^{
            
        }];
    }
}

#pragma mark --检测指定的沙盒目录中是否存在指定的文件
-(BOOL)checkFileFromSandBox:(NSString *)fileUrl
{
    if ([self commonCheckFile:fileUrl]!=nil) {
        return YES;
    }else
    {
        return NO;
    }
}

#pragma mark --文件操作共用检测文件是否存在(提出方法)
-(NSData *)commonCheckFile:(NSString *)fileUrl
{
    NSString *pdfPath=[[UserData shareUserData].fileManagerPath stringByAppendingPathComponent:[self handleStr:fileUrl]];
    NSData *data=[NSData dataWithContentsOfFile:pdfPath];
    return data;
}

#pragma mark --未检索到文件请求下载
-(void)requestFile:(NSString *)fileUrl withSucc:(void(^)(NSData *data))succ withFailed:(void(^)())failed
{
    BaseRequest *baseRequest=[BaseRequest request];
    [baseRequest GetFileRequest:fileUrl withSucc:^(id responseObject) {
        [self CacheFileToSandBox:fileUrl withFileData:responseObject];
        succ(responseObject);
    } withFailed:^(NSString *error) {
        failed();
    }];
}

#pragma mark --处理字符串
-(NSString *)handleStr:(NSString *)str
{
    return [[str cutFromStringByCutCode:@"/"] lastObject];
}

@end
