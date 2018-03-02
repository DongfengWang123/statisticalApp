//
//  RuKuanShenQingListRequestModel.h
//  statisticalApp
//
//  Created by ybmac on 2018/1/4.
//  Copyright © 2018年 ybmac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuKuanShenQingListRequestModel : NSObject

@property(nonatomic,copy)NSString*amount;
@property(nonatomic,copy)NSString*orderNumber;
@property(nonatomic,copy)NSString*remarks;
@property(nonatomic,copy)NSString*rid;
@property(nonatomic,copy)NSString*state;
@property(nonatomic,copy)NSString*time;
@property(nonatomic,copy)NSString*type;
@property(nonatomic,copy)NSString*userName;

+(void)getToRuKuanShenQingListRequestdeviceId:(NSString*)deviceId time:(NSString*)time stateType:(NSString*)stateType startId:(NSInteger)startId length:(NSInteger)length Data:(void(^)(id responceobj))complationBlock;

@end
