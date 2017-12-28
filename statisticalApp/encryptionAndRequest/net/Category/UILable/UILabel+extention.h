//
//  UILabel+extention.h
//  longeapp
//
//  Created by zds on 16/5/26.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (extention)

+(CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+(CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

@end
