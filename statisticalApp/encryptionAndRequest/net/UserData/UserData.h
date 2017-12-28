//
//  UserData.h
//  CSRequest
//
//  Created by zds on 16/4/12.
//  Copyright © 2016年 zds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject

///用户电话
@property(nonatomic,copy)NSString *userName;

///用户memberid
@property(nonatomic,copy)NSString *memberId;
///是否是第一次打开  Yes:第一次打开   No:非第一次打开
@property(nonatomic,assign)BOOL isFirstOpen;

///文件沙盒目录
@property(nonatomic,copy)NSString *fileManagerPath;

///图片沙盒Plist路径
@property(nonatomic,copy)NSString *dataPlistPath;

///会话token
@property(nonatomic,copy)NSString *token;

///用户clientId
@property(nonatomic,copy)NSString *clientId;

///用户机型
@property(nonatomic,copy)NSString *device;

///UUID
@property(nonatomic,copy)NSString *SSKey_UUID;

///单例共享给外部接口
+(UserData *)shareUserData;

///检查是否第一次启动并为单例中isFirstOpen赋值
+(void)checkStartTime;


@end
