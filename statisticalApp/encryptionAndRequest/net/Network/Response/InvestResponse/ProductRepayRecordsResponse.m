//
//  ProductRepayRecordsResponse.m
//  longeapp
//
//  Created by zds on 16/5/10.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "ProductRepayRecordsResponse.h"

@implementation ProductRepayRecordsResponse

+(NSArray *)analysisArray:(id)model
{
    return [ProductRepayRecordRCModel transformModelAddArray:[[model valueForKey:@"data"] objectForKey:@"records"]];
}
@end
