//
//  dateView.h
//  gsjzapp
//
//  Created by zds on 16/8/31.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class dateView;
@protocol dateViewDelegate <NSObject>

@optional

-(void)dateView:(dateView *)dateView dateStr:(NSString *)dateStr;

@end

@interface dateView : UIView

///时间选择器
@property (weak, nonatomic) IBOutlet UIDatePicker *datePiker;

///点击取消
- (IBAction)clickCancel:(UIButton *)sender;

///点击确定
- (IBAction)clickSure:(UIButton *)sender;

///显示
-(void)showOptions;

///关闭
-(void)closeOptions;

///移除window
-(void)removeView;

@property(nonatomic,weak) id <dateViewDelegate>dateViewDelegate;

@end
