//
//  TodayRegisteredListCell.h
//  statisticalApp
//
//  Created by ybmac on 2017/12/21.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayRegisteredListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabelText;
@property (weak, nonatomic) IBOutlet UILabel *zhangHaoLabelText;
@property (weak, nonatomic) IBOutlet UILabel *ziJinLabelText;
@property (weak, nonatomic) IBOutlet UILabel *loginTimeLabelText;
@property (weak, nonatomic) IBOutlet UIButton *detailBtn;
@property (weak, nonatomic) IBOutlet UIButton *statisticalBtn;

@end
