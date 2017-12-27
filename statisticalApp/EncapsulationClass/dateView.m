//
//  dateView.m
//  gsjzapp
//
//  Created by zds on 16/8/31.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "dateView.h"

///屏幕宽
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

///屏幕高
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface dateView ()
{
    UIWindow *window;
    
    UIView *baseView;
    
    NSString *dateStr;
}
@end

@implementation dateView

-(id)init
{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"dateView" owner:nil options:nil] firstObject];
        [self setFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 260)];
        
        window = [[UIApplication sharedApplication] keyWindow];
        
        baseView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight)];
        [baseView setBackgroundColor:[UIColor clearColor]];
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchevent:)];
        [tapGesture setNumberOfTapsRequired:1];
        [baseView addGestureRecognizer:tapGesture];
        [window addSubview:baseView];
        [window addSubview:self];
        
        [self.datePiker addTarget:self action:@selector(oneDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

-(void)showOptions
{
    [UIView animateWithDuration:0.01 animations:^{
        [baseView setFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        [window layoutIfNeeded];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            [baseView setBackgroundColor:[UIColor colorWithRed:.16 green:.17 blue:.21 alpha:0.5]];
            [self setFrame:CGRectMake(0, ScreenHeight-260, ScreenWidth, 260)];
            [window layoutIfNeeded];
        }];
    }];
}

-(void)closeOptions
{
    [UIView animateWithDuration:0.25 animations:^{
        
        [baseView setBackgroundColor:[UIColor clearColor]];
         [self setFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 260)];
        [window layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        [baseView setFrame:CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight)];
        [window layoutIfNeeded];
    }];
}

-(void)removeView
{
    [baseView removeFromSuperview];
    [self removeFromSuperview];
}

- (void)touchevent:(UITapGestureRecognizer *)gesture
{
    [self closeOptions];
}

- (IBAction)clickCancel:(UIButton *)sender {
    [self closeOptions];
}

- (IBAction)clickSure:(UIButton *)sender {
    [self.dateViewDelegate dateView:self dateStr:dateStr];
    [self closeOptions];
}

- (void)oneDatePickerValueChanged:(UIDatePicker *) sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    
    dateStr = [dateFormatter stringFromDate:sender.date];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
