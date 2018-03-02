//
//  TodayRegisteredStatisticalVC.h
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayRegisteredStatisticalVC : UIViewController

@property(nonatomic,copy)NSString*selectStatisticalUserId;

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *touZhuZongELabel;
@property (weak, nonatomic) IBOutlet UILabel *zhongJiangZongELabel;
@property (weak, nonatomic) IBOutlet UILabel *zongFanDianLabel;
@property (weak, nonatomic) IBOutlet UILabel *zongYongJinLabel;
@property (weak, nonatomic) IBOutlet UILabel *chongZhiLabel;
@property (weak, nonatomic) IBOutlet UILabel *tiXianLabel;
@property (weak, nonatomic) IBOutlet UILabel *yuELabel;
@property (weak, nonatomic) IBOutlet UILabel *geRenZongJieSuanLabel;

@end
