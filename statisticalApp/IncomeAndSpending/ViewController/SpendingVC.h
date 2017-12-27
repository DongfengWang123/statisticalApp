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
@end
