//
//  RuKuanShenQingListVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/20.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "RuKuanShenQingListVC.h"
#import "RuKuanShenQingListTableViewCell.h"
#import "RuKuanShenQingListRequestModel.h"
@interface RuKuanShenQingListVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView*tableview;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property(nonatomic,strong)UILabel*noDataLabel;
@end

@implementation RuKuanShenQingListVC

{
   
    NSMutableArray*contentMutableArray;
    NSInteger pageNum;
     BOOL  firstClick;
}
//-(void)viewSafeAreaInsetsDidChange
//{
//    [super viewSafeAreaInsetsDidChange];
//    self.additionalSafeAreaInsets=UIEdgeInsetsMake(0, 0, 34, 0);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title=@"入款申请";
    
    firstClick=YES;
    contentMutableArray=[[NSMutableArray alloc]initWithObjects:@"全部",@"正在申请",@"手动到账",@"自动到账",@"充值失败", nil];
    
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
        [weakSelf  getToRuKuanShenQingListRequest];
    }];
    
    self.tableview.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf  getToRuKuanShenQingListRequest];
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
    static NSString*cellID=@"RuKuanShenQingListTableViewCell";
    RuKuanShenQingListTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"RuKuanShenQingListTableViewCell" owner:nil options:nil]firstObject];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    RuKuanShenQingListRequestModel*model=_dataArray[indexPath.row];
    cell.yongHuLabelText.text=[NSString stringWithFormat:@"%@",model.userName];
    cell.danHaoLabelText.text=[NSString stringWithFormat:@"%@",model.orderNumber];
    cell.jinELabelText.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",model.amount]]];
    
    cell.shiJianLabelText.text=[NSString stringWithFormat:@"%@",[PSGeneral getTimeWithTimestamp:model.time withFormatterStyle:@"YYYY-MM-dd HH:mm:ss"]];
    
    NSInteger typeNum=[model.type integerValue];
    switch (typeNum) {
        case 0:
            cell.leiXingLabelText.text=@"普通转账";
            break;
        case 1:
            cell.leiXingLabelText.text=@"线上支付";
            break;
        case 2:
            cell.leiXingLabelText.text=@"公司入款";
            break;
        case 3:
            cell.leiXingLabelText.text=@"异常补偿";
            break;
        case 4:
            cell.leiXingLabelText.text=@"优惠活动";
            break;
        case 5:
            cell.leiXingLabelText.text=@"代理佣金";
            break;
        case 6:
            cell.leiXingLabelText.text=@"系统扣款";
            break;
            
        default:
            break;
    }
  
    NSInteger  stateNum=[model.state integerValue];
    switch (stateNum) {
        case 0:
            cell.zhuangTaiLabelText.text=@"正在申请";
            break;
        case 1:
            cell.zhuangTaiLabelText.text=@"手动到账";
            break;
        case 2:
            cell.zhuangTaiLabelText.text=@"自动到账";
            break;
        case 3:
            cell.zhuangTaiLabelText.text=@"充值失败";
            break;
            
        default:
            break;
    }

    cell.beiZhuLabelText.text=[NSString stringWithFormat:@"%@",model.remarks];

    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RuKuanShenQingListRequestModel*model=_dataArray[indexPath.row];
    
    CGFloat height=[NSString autoHeightWithString:model.remarks Width:total_WIDTH-90 Font:13.0];
    
    CGFloat newHeight=height>25?height:25;
    
    
    return newHeight+25*6+20+10;
    
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


//状态选择绑定的方法
- (IBAction)stateKindBtnClick:(UIButton *)sender
{
    zySheetPickerView *pickerView = [zySheetPickerView ZYSheetStringPickerWithTitle:contentMutableArray andHeadTitle:@"" Andcall:^(zySheetPickerView *pickerView, NSString *choiceString) {
        self.stateKindLabel.text=choiceString;
        [pickerView dismissPicker];
    }];
    [pickerView show];
    
}

//搜索按钮绑定的方法
- (IBAction)searchBtnClick:(UIButton *)sender
{
    
     firstClick=NO;
    [self  getToTableViewAllData];
}


#pragma mark====网络数据请求====网络数据请求====网络数据请求====网络数据请求====网络数据请求====网络数据请求====网络数据请求====网络数据请求

-(void)getToRuKuanShenQingListRequest
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
        RuKuanShenQingListRequestModel*userIdModel=[_dataArray lastObject];
        NSInteger userId=[userIdModel.rid integerValue];
        startId=userId;
    }
    
    NSInteger stateType=[contentMutableArray indexOfObject:self.stateKindLabel.text];
    
    __weak typeof(self) weakSelf=self;
    
    [RuKuanShenQingListRequestModel getToRuKuanShenQingListRequestdeviceId:[PSGeneral getLocalData:@"deviceLogoStr"] time:timeInterval stateType:[NSString stringWithFormat:@"%ld",stateType] startId:startId length:10 Data:^(id responceobj)
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
