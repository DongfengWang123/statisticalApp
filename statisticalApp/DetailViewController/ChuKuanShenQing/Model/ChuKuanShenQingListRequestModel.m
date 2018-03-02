//
//  ChuKuanShenQingListRequestModel.m
//  statisticalApp
//
//  Created by ybmac on 2018/1/5.
//  Copyright © 2018年 ybmac. All rights reserved.
//

#import "ChuKuanShenQingListRequestModel.h"

@implementation ChuKuanShenQingListRequestModel

+(void)getToChuKuanShenQingListRequestdeviceId:(NSString*)deviceId time:(NSString*)time startId:(NSInteger)startId length:(NSInteger)length Data:(void(^)(id responceobj))complationBlock
{
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"deviceId"]=deviceId;
    params[@"time"]=time;
    params[@"startId"]=@(startId);
    params[@"length"]=@(length);
    
    HttpTool*request=[HttpTool request];
    [SVProgressHUD showWithStatus:@"数据加载中"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    [request post:baseUrl(getWithdrawalList_Url) parameters:params swithSucess:^(NSDictionary *dic)
    {
        [SVProgressHUD dismiss];
        
        if (dic)
        {
            NSString*msg=VerifyJsonValue(dic[@"msg"]);
            NSInteger status=[VerifyJsonValue(dic[@"status"]) integerValue];
            if (status==0)
            {
                NSMutableArray*array=VerifyJsonValue([dic[@"data"]objectForKey:@"data"]);
                if (array.count)
                {
                    NSMutableArray*dataArray=[ChuKuanShenQingListRequestModel mj_objectArrayWithKeyValuesArray:array];
                    if (complationBlock)
                    {
                        complationBlock(dataArray);
                    }
                    
                }else
                {
                    if (complationBlock)
                    {
                        NSError*error=[NSError errorWithDomain:@"没有更多数据了" code:0 userInfo:nil];
                        complationBlock(error);
                    }
                }
                
            }else
            {
                [SVProgressHUD showErrorWithStatus:msg];
            }
        }
        
        
       
  
    } withFailed:^(NSString *error, int status) {
        
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:error];
    }];
}
@end
