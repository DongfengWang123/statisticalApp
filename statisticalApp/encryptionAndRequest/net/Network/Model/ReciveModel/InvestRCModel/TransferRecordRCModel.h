//
//  TransferRecordRCModel.h
//  longeapp
//
//  Created by zds on 16/5/16.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface TransferRecordRCModel : BaseModel

@property(nonatomic,copy)NSString *buyingMemberNm;    //转让人
@property(nonatomic,strong)NSNumber *transactionDate;      //投资时间
@property(nonatomic,strong)NSNumber *transferPrice;    //转让单价
@property(nonatomic,strong)NSNumber *buyingQuantity;    //转让份数

@end
