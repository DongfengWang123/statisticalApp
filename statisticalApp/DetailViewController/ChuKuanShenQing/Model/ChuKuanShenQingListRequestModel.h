//
//  ChuKuanShenQingListRequestModel.h
//  statisticalApp
//
//  Created by ybmac on 2018/1/5.
//  Copyright © 2018年 ybmac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChuKuanShenQingListRequestModel : NSObject

@property(nonatomic,copy)NSString*accountName;
@property(nonatomic,copy)NSString*amount;
@property(nonatomic,copy)NSString*bankNumber;
@property(nonatomic,copy)NSString*bankType;
@property(nonatomic,copy)NSString*gid;
@property(nonatomic,copy)NSString*poundage;
@property(nonatomic,copy)NSString*superior;
@property(nonatomic,copy)NSString*time;
@property(nonatomic,copy)NSString*userName;

+(void)getToChuKuanShenQingListRequestdeviceId:(NSString*)deviceId time:(NSString*)time startId:(NSInteger)startId length:(NSInteger)length Data:(void(^)(id responceobj))complationBlock;
@end
