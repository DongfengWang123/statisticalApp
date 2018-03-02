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
#import "TodayRegisteredRequestModel.h"
@interface TodayRegisteredVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*tableview;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property(nonatomic,strong)UILabel*noDataLabel;
@end

@implementation TodayRegisteredVC
{
     NSMutableArray*contentMutableArray;
    NSInteger pageNum;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    contentMutableArray=[[NSMutableArray alloc]initWithObjects:@"全部",@"会员",@"代理",@"虚拟",@"试玩", nil];
    self.navigationItem.title=self.ItemStr;
    
      [self tableview];//创建tableview
     [self getToTableViewAllData];//列表进行数据请求
}



//列表进行数据请求
-(void)getToTableViewAllData
{
    
    __weak typeof(self) weakSelf=self;
    
    
    self.tableview.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        pageNum=0;
        [weakSelf  getToTodayRegisteredListRequest];
    }];
    
    self.tableview.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf  getToTodayRegisteredListRequest];
    }];
    
    [self.tableview.mj_header beginRefreshing];
    
    
}

//创建数组进行接收数据
-(NSMutableArray*)dataArray
{
    if (!_dataArray)
    {
        _dataArray=[NSMutableArray array];
    }
    return _dataArray;
}

//当没有数据的时候创建Label进行展示
-(UILabel*)noDataLabel
{
    if (!_noDataLabel)
    {
        _noDataLabel=[[UILabel alloc]init];
        _noDataLabel.frame=CGRectMake(0, 0, total_WIDTH, total_HEIGHT);
        _noDataLabel.text=@"暂无数据";
        _noDataLabel.textAlignment = NSTextAlignmentCenter;
        _noDataLabel.font = [UIFont systemFontOfSize:25];
        _noDataLabel.textColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        [self.view addSubview:_noDataLabel];
    }
    
    return _noDataLabel;
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
    return _dataArray.count;
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
    
    TodayRegisteredRequestModel*model=_dataArray[indexPath.row];
    cell.nameLabelText.text=[NSString stringWithFormat:@"%@",model.name];
    cell.zhangHaoLabelText.text=[NSString stringWithFormat:@"%@",model.account];
    cell.ziJinLabelText.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",model.amount]]];
    cell.loginTimeLabelText.text=[NSString stringWithFormat:@"%@",[PSGeneral getTimeWithTimestamp:model.loginTime withFormatterStyle:@"YYYY-MM-dd HH:mm:ss"]];
    
    
    return cell;
}


#pragma mark-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件

//详情按钮绑定的方法
-(void)detailBtnClick:(UIButton*)btn
{
    UITableViewCell*cell=(UITableViewCell*)btn.superview.superview.superview;
    
    NSIndexPath*indexPath=[_tableview indexPathForCell:cell];
    TodayRegisteredRequestModel*model=_dataArray[indexPath.row];
    
    TodayRegisteredDetailVC*detailVC=[[TodayRegisteredDetailVC alloc ]init];
    detailVC.selectUserId=model.userId;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

//统计按钮绑定的方法
-(void)statisticalBtnClick:(UIButton*)btn
{
    UITableViewCell*cell=(UITableViewCell*)btn.superview.superview.superview;
    
    NSIndexPath*indexPath=[_tableview indexPathForCell:cell];
    TodayRegisteredRequestModel*model=_dataArray[indexPath.row];
    
    TodayRegisteredStatisticalVC*statisticalVC=[[TodayRegisteredStatisticalVC alloc ]init];
    statisticalVC.selectStatisticalUserId=model.userId;
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
      [self  getToTableViewAllData];
}


#pragma mark====网络数据请求====网络数据请求====网络数据请求====网络数据请求====网络数据请求====网络数据请求====网络数据请求====网络数据请求

-(void)getToTodayRegisteredListRequest
{
    NSInteger startId=0;
    
    if (pageNum==0)
    {
        startId=0;
    }else
    {
        TodayRegisteredRequestModel*Model=[_dataArray lastObject];
        NSInteger userId=[Model.userId integerValue];
        startId=userId;
    }
    
    NSInteger stateType=0;
    if ([self.zhuangTaiLabelText.text isEqualToString:@"状态类型"])
    {
        stateType=0;
    }else{
        
        stateType= [contentMutableArray indexOfObject:self.zhuangTaiLabelText.text];
    }
   
    NSMutableArray*flagArray=[[NSMutableArray alloc]initWithObjects:@"今日注册",@"在线试玩",@"新充人数",@"总充人数",@"在线会员",@"在线代理", nil];
    
    NSInteger flagNum=[flagArray indexOfObject:self.ItemStr]+1;
    __weak typeof(self) weakSelf=self;
    
    [TodayRegisteredRequestModel getToTodayRegisteredRequestDeviceId:[PSGeneral getLocalData:@"deviceLogoStr"] state:[NSString stringWithFormat:@"%ld",stateType] startId:startId length:10 username:self.membersNameTextField.text flag:flagNum Data:^(id responceobj)
    {
        ++pageNum;
        [weakSelf.tableview.mj_header endRefreshing];
        [weakSelf.tableview.mj_footer endRefreshing];
        
        if ([responceobj isKindOfClass:[NSMutableArray class]])
        {
            if (startId==0)
            {
                [_noDataLabel removeFromSuperview];
                weakSelf.dataArray=responceobj;
                [weakSelf.tableview reloadData];
                
            }else
            {
                [_noDataLabel removeFromSuperview];
                [weakSelf.dataArray addObjectsFromArray:responceobj];
                [weakSelf.tableview reloadData];
            }
            
        }else
        {
            if (startId==0)
            {
                //没有数据
                [self noDataLabel];
                
                [weakSelf.dataArray removeAllObjects];
                
            }else
            {
                //没有更多数据
                [_noDataLabel removeFromSuperview];
                
                weakSelf.tableview.mj_footer.state=MJRefreshStateNoMoreData;
            }
            
            
            [weakSelf.tableview reloadData];
            
        }
        
    }];
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
