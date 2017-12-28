//
//  NSString+extention.h
//  CSRequest
//
//  Created by zds on 16/4/13.
//  Copyright © 2016年 zds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (extention)

/**
 *将字符串通过某种字符切割成数组
 *cutCode:切割字符
 */
-(NSArray *)cutFromStringByCutCode:(NSString *)cutCode;

@end
