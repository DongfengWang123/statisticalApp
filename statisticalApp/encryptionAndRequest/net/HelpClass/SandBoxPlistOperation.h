//
//  SandBoxPlistOperation.h
//  CSRequest
//
//  Created by zds on 16/4/15.
//  Copyright © 2016年 zds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SandBoxPlistOperation : NSObject

/***************沙盒Plist文件操作(轻量数据操作)********************/
///快速初始化类
+(instancetype)operate;

///将数据保存到沙盒指定的plist文件中
-(void)saveDataToSandBoxPlistFile:(NSString *)keyName withValue:(NSString *)valueStr;

///从沙盒指定的plist文件中读取数据
-(NSString *)readDataFromSandBoxPlistFile:(NSString *)keyName;

@end
