//
//  ChuKuanShenQingListVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/21.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "ChuKuanShenQingListVC.h"
#import "ChuKuanShenQingListRequestModel.h"
#import "ChuKuanShenQingListCell.h"
@interface ChuKuanShenQingListVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*tableview;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property(nonatomic,strong)UILabel*noDataLabel;
@end

@implementation ChuKuanShenQingListVC
{
        NSInteger pageNum;
      BOOL  firstClick;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title=@"出款申请";

    firstClick=YES;
    self.startTimeLabel.text=[PSGeneral getNowYearDateFormat:@"YYYY/MM/dd"];
    self.endTimeLabel.text=[PSGeneral GetTomorrowDay:[PSGeneral nsstringConversionDateFormat:@"YYYY/MM/dd" datestring:[PSGeneral getNowYearDateFormat:@"YYYY/MM/dd"]]];
    [self tableview];//创建tableview
     [self getToTableViewAllData];//列表进行数据请求
    
}

//列表进行数据请求
-(void)getToTableViewAllData
{
    
    __weak typeof(self) weakSelf=self;
    
    
    self.tableview.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        pageNum=0;
        [weakSelf  getToChuKuanShenQingListRequest];
    }];
    
    self.tableview.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf  getToChuKuanShenQingListRequest];
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
        _tableview.rowHeight=25*8+20+20;
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
    static NSString*cellID=@"ChuKuanShenQingListCell";
    ChuKuanShenQingListCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"ChuKuanShenQingListCell" owner:nil options:nil]firstObject];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    ChuKuanShenQingListRequestModel*model=_dataArray[indexPath.row];
    
    cell.userNameLabelText.text=[NSString stringWithFormat:@"%@",model.userName];
    cell.kaiHuXingMingLabelText.text=[NSString stringWithFormat:@"%@",model.accountName];
    cell.bankNumberLabelText.text=[NSString stringWithFormat:@"%@",model.bankNumber];
    cell.tiXianMoneyLabelText.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",model.amount]]];
    cell.shouXuFeiLabelText.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",model.poundage]]];
    cell.bankKindLabelText.text=[NSString stringWithFormat:@"%@",model.bankType];
    cell.tiXianTimeLabelText.text=[NSString stringWithFormat:@"%@",[PSGeneral getTimeWithTimestamp:model.time withFormatterStyle:@"YYYY-MM-dd HH:mm:ss"]];
    
    if (kObjectIsEmpty(model.superior))
    {
        cell.shangJiGuanXiLabelText.text=nil;
    }else
    {
           cell.shangJiGuanXiLabelText.text=[NSString stringWithFormat:@"%@",model.superior];
    }
 
     
    return cell;
}


#pragma mark-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件

//选择日期绑定的方法
- (IBAction)startTimeBtnClick:(UIButton *)sender
{
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {
        
        NSString *date = [selectDate stringWithFormat:@"YYYY/MM/dd"];
        
        self.startTimeLabel.text=date;
        
        
    }];
    datepicker.dateLabelColor = [UIColor orangeColor];//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    datepicker.doneButtonColor = RGBA(21, 170, 255, 1);//确定按钮的颜色
    [datepicker show];
}

- (IBAction)endTimeBtnClick:(UIButton *)sender
{
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {
        
        
        NSString *date = [selectDate stringWithFormat:@"YYYY/MM/dd"];
        self.endTimeLabel.text=date;
        
    }];
    datepicker.dateLabelColor = [UIColor orangeColor];//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    datepicker.doneButtonColor = RGBA(21, 170, 255, 1);//确定按钮的颜色
    
    [datepicker show];
}



//搜索按钮绑定的方法
- (IBAction)searchBtnClick:(UIButton *)sender
{
     firstClick=NO;
     [self  getToTableViewAllData];
}


#pragma mark====网络数据请求====网络数据请求====网络数据请求====网络数据请求====网络数据请求====网络数据请求====网络数据请求====网络数据请求

-(void)getToChuKuanShenQingListRequest
{
    
    NSString*timeInterval=nil;
    if (firstClick==YES)
    {
       timeInterval= [NSString stringWithFormat:@"0,%ld",[PSGeneral timeSwitchTimestamp:self.endTimeLabel.text andFormatter:@"YYYY/MM/dd"]];
    }else
    {
       timeInterval= [NSString stringWithFormat:@"%ld,%ld",[PSGeneral timeSwitchTimestamp:self.startTimeLabel.text andFormatter:@"YYYY/MM/dd"],[PSGeneral timeSwitchTimestamp:self.endTimeLabel.text andFormatter:@"YYYY/MM/dd"]];
    }
   
    
    NSInteger startId=0;
    
    if (pageNum==0)
    {
        startId=0;
    }else
    {
        ChuKuanShenQingListRequestModel*userIdModel=[_dataArray lastObject];
        NSInteger userId=[userIdModel.gid integerValue];
        startId=userId;
    }
    
   
    
    __weak typeof(self) weakSelf=self;
    
    [ChuKuanShenQingListRequestModel getToChuKuanShenQingListRequestdeviceId:[PSGeneral getLocalData:@"deviceLogoStr"] time:timeInterval startId:startId length:10 Data:^(id responceobj) {
        
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
                
                [self noDataLabel];
                
                [weakSelf.dataArray removeAllObjects];
                
            }else
            {
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
