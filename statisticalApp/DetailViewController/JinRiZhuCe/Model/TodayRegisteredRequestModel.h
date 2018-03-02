//
//  TodayRegisteredRequestModel.h
//  statisticalApp
//
//  Created by ybmac on 2018/1/5.
//  Copyright © 2018年 ybmac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodayRegisteredRequestModel : NSObject


@property(nonatomic,copy)NSString*account;
@property(nonatomic,copy)NSString*amount;
@property(nonatomic,copy)NSString*loginTime;
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*userId;


+(void)getToTodayRegisteredRequestDeviceId:(NSString*)deviceId state:(NSString*)state startId:(NSInteger)startId length:(NSInteger)length username:(NSString*)username flag:(NSInteger)flag Data:(void(^)(id responceobj))complationBlock;

@end
