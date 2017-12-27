//
//  NSDictionary+CustomDicTag.m
//  小黄人
//
//  Created by Black on 17/7/20.
//  Copyright © 2017年 Black. All rights reserved.
//

#import "NSDictionary+CustomDicTag.h"
#import <objc/runtime.h>

@implementation NSDictionary (CustomDicTag)

static char *DICTAG = "CustonTag";

- (void)setTag:(NSInteger)tag
{
    NSString * s = [NSString stringWithFormat:@"%ld",(long)tag];
    objc_setAssociatedObject(self, DICTAG,s,OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSInteger)tag
{
    return [objc_getAssociatedObject(self, DICTAG) integerValue];
}
@end
