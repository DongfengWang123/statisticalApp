//
//  SandBoxFileOperate.h
//  CSRequest
//
//  Created by zds on 16/4/14.
//  Copyright © 2016年 zds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SandBoxFileOperate : NSObject

/*****************文件操作********************/

///快速初始化类
+(instancetype)operate;

///存储文件到沙盒指定目录
-(void)CacheFileToSandBox:(NSString *)fileUrl withFileData:(NSData *)fileData;

///从沙盒指定目录读取文件
-(void)readFileFromSandBox:(NSString *)fileUrl withSuccData:(void(^)(NSData *data))fileData;

///在沙盒指定目录中检测文件是否存在
-(BOOL)checkFileFromSandBox:(NSString *)fileUrl;

@end
