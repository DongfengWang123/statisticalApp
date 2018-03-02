//
//  TodayRegisteredDetailVC.h
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayRegisteredDetailVC : UIViewController
@property(nonatomic,copy)NSString*selectUserId;
@property (weak, nonatomic) IBOutlet UILabel *shangJiGuanXiLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhenShiNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yongHuZhangHaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhangHuYuELabel;
@property (weak, nonatomic) IBOutlet UILabel *dongJieJinELabel;
@property (weak, nonatomic) IBOutlet UILabel *yuEZhuanZhangLabel;
@property (weak, nonatomic) IBOutlet UILabel *xiaoXiFaSongLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxFanDianLabel;
@property (weak, nonatomic) IBOutlet UILabel *liuHeCaiFanDianLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhangHaoDongJieLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhangHaoLeiXingLabel;
@property (weak, nonatomic) IBOutlet UILabel *ShouJiHaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *youXiangDiZhiLabel;
@property (weak, nonatomic) IBOutlet UILabel *qqNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhuCeIPLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhuCeTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *loginIPLabel;
@property (weak, nonatomic) IBOutlet UILabel *loginTimeLabel;

@end
