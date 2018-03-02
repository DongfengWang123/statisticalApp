//
//  SpendingVC.h
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpendingVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;

@property (weak, nonatomic) IBOutlet UIButton *startTimeBtn;
@property (weak, nonatomic) IBOutlet UIButton *endTimeBtn;

@property (weak, nonatomic) IBOutlet UIView *scrollowBgView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollowHeightConstraint;



@property (weak, nonatomic) IBOutlet UILabel *chuKuanYuanLabel;
@property (weak, nonatomic) IBOutlet UILabel *chuKuanBiLabel;
@property (weak, nonatomic) IBOutlet UILabel *chuKuanRenLabel;
@property (weak, nonatomic) IBOutlet UILabel *youHuiYuanLabel;
@property (weak, nonatomic) IBOutlet UILabel *youHuiBiLabel;
@property (weak, nonatomic) IBOutlet UILabel *youHuiRenLabel;
@property (weak, nonatomic) IBOutlet UILabel *kouKuanYuanLabel;
@property (weak, nonatomic) IBOutlet UILabel *kouKuanBiLabel;
@property (weak, nonatomic) IBOutlet UILabel *kouKuanRenLabel;
@property (weak, nonatomic) IBOutlet UILabel *fanShuiYuanLabel;
@property (weak, nonatomic) IBOutlet UILabel *fanShuiBiLabel;
@property (weak, nonatomic) IBOutlet UILabel *fanShuiRenLabel;


@end
