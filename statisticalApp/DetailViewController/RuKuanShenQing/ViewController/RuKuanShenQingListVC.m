//
//  RuKuanShenQingListVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/20.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "RuKuanShenQingListVC.h"
#import "RuKuanShenQingListTableViewCell.h"
#import "dateView.h"
@interface RuKuanShenQingListVC ()<UITableViewDelegate,UITableViewDataSource,dateViewDelegate>

@property(nonatomic,strong)UITableView*tableview;

@end

@implementation RuKuanShenQingListVC

{
    dateView *dateview;
    NSMutableArray*contentMutableArray;
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
    
    contentMutableArray=[[NSMutableArray alloc]initWithObjects:@"全部",@"正在申请",@"手动到账",@"自动到账",@"管理员充值",@"充值失败", nil];
    
    self.startTimeLabel.text=[PSGeneral getNowYearDateFormat:@"YYYY/MM/dd"];
    self.endTimeLabel.text=[PSGeneral GetTomorrowDay:[PSGeneral nsstringConversionDateFormat:@"YYYY/MM/dd" datestring:[PSGeneral getNowYearDateFormat:@"YYYY/MM/dd"]]];
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
        _tableview.rowHeight=25*7+20+20;
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
    static NSString*cellID=@"RuKuanShenQingListTableViewCell";
    RuKuanShenQingListTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"RuKuanShenQingListTableViewCell" owner:nil options:nil]firstObject];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件

//选择日期绑定的方法
- (IBAction)startTimeBtnClick:(UIButton *)sender
{
    dateview = [[dateView alloc]init];
    dateview.dateViewDelegate = self;
    dateview.tag=11;
    [dateview showOptions];
}

- (IBAction)endTimeBtnClick:(UIButton *)sender
{
    dateview = [[dateView alloc]init];
    dateview.dateViewDelegate = self;
    dateview.tag=22;
    [dateview showOptions];
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
    
}


#pragma mark----代理----代理----代理----代理----代理----代理----代理----代理----代理----代理----代理----代理----代理----代理----代理----代理----代理----代理----代理----代理----代理

//dateView的代理
-(void)dateView:(dateView *)dateView dateStr:(NSString *)dateStr
{
    if (dateview.tag==11)
    {
        if (dateStr)
        {
            
            self.startTimeLabel.text=dateStr;
            
        }
        
    }else if (dateview.tag==22)
    {
        if (dateStr)
        {
             self.endTimeLabel.text=dateStr;
            
          
        }
        
    }
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
