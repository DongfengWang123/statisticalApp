//
//  AccountCommonResponse.h
//  longeapp
//
//  Created by zds on 16/5/11.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WaiteReciveMoneyRCModel.h"
#import "ReciveMoneyRCModel.h"
#import "MyBorrowAgoPlanModel.h"
#import "MyBorrowRepayPlanRCModel.h"
#import "MyBorrowAfterRCModel.h"
#import "MyRepayWaiteInfoRCModel.h"
#import "MyRepayEdRCModel.h"
#import "SafeModel.h"
#import "MyMsgRCModel.h"
#import "AccountMoneyRCModel.h"
#import "BusinessRecordsRCModel.h"

@interface AccountCommonResponse : NSObject

///待收款明细解析
+(NSArray *)WaiteReciveMoneyResponse:(id)model;

///已收款明细解析
+(NSArray *)ReciveMoneyResponse:(id)model;

///借款招标中项目
+(NSArray *)BorrowAgoPlanResponse:(id)model;

///我的借款还款中项目
+(NSArray *)MyBorrowRepayResponse:(id)model;

///我的借款还款后
+(NSArray *)MyBorrowAfterResponse:(id)model;

///我的还款待还款明细
+(NSArray *)MyRepayWaiteInfoResponse:(id)model;

///我的还款已经还款明细
+(NSArray *)MyRepayEdInfoResponse:(id)model;

///安全认证解析
+(SafeModel *)safeResponse:(id)model;

///我的消息解析
+(NSArray *)MyMsgResponse:(id)model;

///获取账户余额
+(AccountMoneyRCModel *)AccountMoneyResponse:(id)model;

///交易记录解析
+(NSArray *)BusinessRecordsResponse:(id)model;
@end
