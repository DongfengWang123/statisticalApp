//
//  GestureHelpClass.h
//  longeapp
//
//  Created by zds on 16/5/23.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface GestureHelpClass : NSObject

#pragma mark --property
///左向回调
@property(nonatomic,copy)void(^left)();

///右向回调
@property(nonatomic,copy)void(^right)();



#pragma mark --Func
///添加左向手势
-(void)LeftGesture:(UIView *)View;

///添加右向手势
-(void)RightGesture:(UIView *)View;

@end
