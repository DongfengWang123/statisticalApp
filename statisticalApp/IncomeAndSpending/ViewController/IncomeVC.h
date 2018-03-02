//
//  IncomeVC.h
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IncomeVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;

@property (weak, nonatomic) IBOutlet UIButton *startTimeBtn;
@property (weak, nonatomic) IBOutlet UIButton *endTimeBtn;

@property (weak, nonatomic) IBOutlet UIView *scrollowBgView;
@property (weak, nonatomic) IBOutlet UIScrollView *bigScrollow;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollowHeightConstraint;


@property (weak, nonatomic) IBOutlet UILabel *ruZhangYuanLabel;
@property (weak, nonatomic) IBOutlet UILabel *ruZhangBiLabel;
@property (weak, nonatomic) IBOutlet UILabel *ruZhangRenLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhiFuYuanLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhiFuBiLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhiFuRenLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhuangZhuangYuanLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhuangZhuangBiLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhuangZhuangRenLabel;
@property (weak, nonatomic) IBOutlet UILabel *buChangYuanLabel;
@property (weak, nonatomic) IBOutlet UILabel *buChangBiLabel;
@property (weak, nonatomic) IBOutlet UILabel *buChangRenLabel;
@property (weak, nonatomic) IBOutlet UILabel *yongJinYuanLabel;
@property (weak, nonatomic) IBOutlet UILabel *yongJinBiLabel;
@property (weak, nonatomic) IBOutlet UILabel *yongJinRenLabel;
@end
