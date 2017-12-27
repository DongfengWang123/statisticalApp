//
//  TodayRegisteredStatisticalVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "TodayRegisteredStatisticalVC.h"
#import "TodayRegisteredDetailCell.h"
@interface TodayRegisteredStatisticalVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*tableview;

@end

@implementation TodayRegisteredStatisticalVC
{
    NSMutableArray*titleArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title=@"统计";
    
    titleArray=[[NSMutableArray alloc]initWithObjects:@"用户名:",@"投注总额:",@"中奖总额:",@"总返点:",@"总佣金:",@"充值:",@"体现:",@"余额:",@"个人总结算:",nil];
    [self tableview];//创建tableview
    
}

//创建tableview
-(UITableView*)tableview
{
    if (!_tableview)
    {
        _tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,0, total_WIDTH, total_HEIGHT-64) style:UITableViewStylePlain];
        
        if (@available(iOS 11.0, *)) {
            _tableview.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
        } else {
            _tableview.translatesAutoresizingMaskIntoConstraints = NO;
        }
        _tableview.delegate=self;
        _tableview.dataSource=self;
        _tableview.rowHeight=45;
        _tableview.estimatedRowHeight = 0;
        _tableview.estimatedSectionHeaderHeight = 0;
        _tableview.estimatedSectionFooterHeight = 0;
        _tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableview];
    }
    return _tableview;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*cellID=@"TodayRegisteredDetailCell";
    TodayRegisteredDetailCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"TodayRegisteredDetailCell" owner:nil options:nil]firstObject];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.detailTitleLabel.text=titleArray[indexPath.row];
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
