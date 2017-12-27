//
//  TodayRegisteredDetailVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "TodayRegisteredDetailVC.h"
#import "TodayRegisteredDetailCell.h"
@interface TodayRegisteredDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*tableview;

@end

@implementation TodayRegisteredDetailVC
{
    NSMutableArray*titleArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title=@"详情";
    
    titleArray=[[NSMutableArray alloc]initWithObjects:@"上级关系:",@"真实姓名:",@"用户账号:",@"账户余额:",@"冻结金额:",@"余额转账:",@"消息发送:",@"最大返点:",@"六合彩返点:",@"账号冻结:",@"账号类型:",@"手机号码:",@"邮箱地址:",@"QQ号码:",@"注册IP:",@"注册时间:",@"最后登录IP:",@"最后登录时间:", nil];
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
    return 18;
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
