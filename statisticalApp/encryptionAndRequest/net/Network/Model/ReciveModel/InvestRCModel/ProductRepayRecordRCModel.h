//
//  ProductRepayRecordRCModel.h
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface ProductRepayRecordRCModel : BaseModel

@property(nonatomic,copy)NSString *investMember;    //投资人
@property(nonatomic,strong)NSNumber *investTime;      //投资时间
@property(nonatomic,strong)NSNumber *investAmount;    //投资金额

@end
