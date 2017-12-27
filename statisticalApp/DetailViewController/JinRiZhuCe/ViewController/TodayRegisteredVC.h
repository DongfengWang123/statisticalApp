//
//  TodayRegisteredVC.h
//  statisticalApp
//
//  Created by ybmac on 2017/12/21.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayRegisteredVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *zhuangTaiLabelText;
@property (weak, nonatomic) IBOutlet UIButton *zhuangTaiBtn;
@property (weak, nonatomic) IBOutlet UITextField *membersNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;


@property(nonatomic,copy)NSString*ItemStr;
@end
