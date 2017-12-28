//
//  GestureHelpClass.m
//  longeapp
//
//  Created by zds on 16/5/23.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "GestureHelpClass.h"

@implementation GestureHelpClass

-(void)LeftGesture:(UIView *)View
{
   
    UISwipeGestureRecognizer *Leftrecongnizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftDirect)];
    [Leftrecongnizer setDirection:UISwipeGestureRecognizerDirectionRight];
    [View addGestureRecognizer:Leftrecongnizer];
}

-(void)leftDirect
{
    if (self.left) {
        self.left();
    }
}

@end
