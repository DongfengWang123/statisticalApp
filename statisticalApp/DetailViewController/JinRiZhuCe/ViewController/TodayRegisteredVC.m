//
//  TodayRegisteredVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/21.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "TodayRegisteredVC.h"
#import "TodayRegisteredListCell.h"
#import "TodayRegisteredDetailVC.h"
#import "TodayRegisteredStatisticalVC.h"
@interface TodayRegisteredVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*tableview;
@end

@implementation TodayRegisteredVC
{
     NSMutableArray*contentMutableArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    contentMutableArray=[[NSMutableArray alloc]initWithObjects:@"全部",@"会员",@"代理",@"虚拟",@"试玩", nil];
    self.navigationItem.title=self.ItemStr;
    
      [self tableview];//创建tableview
}

//创建tableview
-(UITableView*)tableview
{
    if (!_tableview)
    {
        _tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,45, total_WIDTH, total_HEIGHT-45-64) style:UITableViewStylePlain];
        
        if (@available(iOS 11.0, *)) {
            _tableview.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
        } else {
            _tableview.translatesAutoresizingMaskIntoConstraints = NO;
        }
        _tableview.delegate=self;
        _tableview.dataSource=self;
        _tableview.rowHeight=80+20;
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
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*cellID=@"TodayRegisteredListCell";
    TodayRegisteredListCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"TodayRegisteredListCell" owner:nil options:nil]firstObject];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    [cell.detailBtn addTarget:self action:@selector(detailBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.statisticalBtn addTarget:self action:@selector(statisticalBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}


#pragma mark-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件

//详情按钮绑定的方法
-(void)detailBtnClick:(UIButton*)btn
{
    UITableViewCell*cell=(UITableViewCell*)btn.superview.superview.superview;
    
    NSIndexPath*indexPath=[_tableview indexPathForCell:cell];
    
    TodayRegisteredDetailVC*detailVC=[[TodayRegisteredDetailVC alloc ]init];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

//统计按钮绑定的方法
-(void)statisticalBtnClick:(UIButton*)btn
{
    UITableViewCell*cell=(UITableViewCell*)btn.superview.superview.superview;
    
    NSIndexPath*indexPath=[_tableview indexPathForCell:cell];
    TodayRegisteredStatisticalVC*statisticalVC=[[TodayRegisteredStatisticalVC alloc ]init];
    [self.navigationController pushViewController:statisticalVC animated:YES];
}

//状态选择绑定的方法
- (IBAction)stateKindBtnClick:(UIButton *)sender
{
    zySheetPickerView *pickerView = [zySheetPickerView ZYSheetStringPickerWithTitle:contentMutableArray andHeadTitle:@"" Andcall:^(zySheetPickerView *pickerView, NSString *choiceString) {
        self.zhuangTaiLabelText.text=choiceString;
        [pickerView dismissPicker];
    }];
    [pickerView show];
    
}

//搜索按钮绑定的方法
- (IBAction)searchBtnClick:(UIButton *)sender
{
    
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
