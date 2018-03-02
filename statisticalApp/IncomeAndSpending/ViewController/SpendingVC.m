//
//  SpendingVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "SpendingVC.h"

#import "JXCircleModel.h"
#import "JXCircleRatioView.h"
#define PIE_HEIGHT  250
#define Radius 100.5 //圆形比例图的半径
@interface SpendingVC ()
@property(nonatomic, strong) JXCircleRatioView *circleView;
@property(nonatomic, strong) NSMutableArray *dataArray;
@property(nonatomic, strong) NSMutableArray *numberArray;
@end

@implementation SpendingVC
{
   
    NSString*amountStr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
      self.scrollowHeightConstraint.constant=45+PIE_HEIGHT+55*4;
    
    self.startTimeLabel.text=[PSGeneral getNowYearDateFormat:@"YYYY/MM/dd"];
    self.endTimeLabel.text=[PSGeneral GetTomorrowDay:[PSGeneral nsstringConversionDateFormat:@"YYYY/MM/dd" datestring:[PSGeneral getNowYearDateFormat:@"YYYY/MM/dd"]]];
    
    //获取数据请求
    [self  getToSpendingListRequest];
 
    
}

-(NSMutableArray*)numberArray
{
    if (!_numberArray)
    {
        _numberArray=[NSMutableArray array];
    }
    
    return _numberArray;
}

- (void)createDataArray
{
    _dataArray = [NSMutableArray array];
    [_dataArray removeAllObjects];
        
        NSArray *colors = @[RGBA(202, 220, 84,1),RGBA(250, 185, 109,1),RGBA(106, 105, 240,1),RGBA(110, 238, 195,1)];
    
        NSArray *names = @[@"担保产品",@"粤财汇",@"信托产品",@"投资",@"资产产品"];
        
        
    NSInteger totalNum=0;
    for (int i = 0; i < _numberArray.count; i++)
    {
        NSString*str=[_numberArray objectAtIndex:i];
        if ([str isEqualToString:@"0"])
        {
            ++totalNum;
        }
        if (totalNum==_numberArray.count)
        {
            
            JXCircleModel *model = [[JXCircleModel alloc]init];
            model.color =RGBA(239, 241, 239, 1);
            model.number =@"10";//任意值
            model.name = names[i];
            model.shouRuNumStr=amountStr;
            [_dataArray  addObject:model];
        }else
        {
            
            JXCircleModel *model = [[JXCircleModel alloc]init];
            model.color = colors[i];
            model.number = _numberArray[i];
            model.name = names[i];
            model.shouRuNumStr=amountStr;
            [_dataArray  addObject:model];
        }
        
    }

}

//创建图标
- (void)createCircleView
{
    
    [_circleView removeFromSuperview];
    
    [self createDataArray];
    
    _circleView=[[JXCircleRatioView alloc]initWithFrame:CGRectMake(0, 0,total_WIDTH, PIE_HEIGHT) andDataArray:self.dataArray CircleRadius:Radius];
    _circleView.backgroundColor = [UIColor whiteColor];
    _circleView.shouRuLabelStr=@"总支出";
    //添加圆形比例图
    [self.scrollowBgView addSubview:self.circleView];
    
}



#pragma mark-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件-----按钮的单击事件

//选择日期绑定的方法
- (IBAction)startTimeBtnClick:(UIButton *)sender
{
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {
        
        NSString *date = [selectDate stringWithFormat:@"YYYY/MM/dd"];
        
        self.startTimeLabel.text=date;
        
        //获取数据请求
        [self  getToSpendingListRequest];
        
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
        //获取数据请求
        [self  getToSpendingListRequest];
        
    }];
    datepicker.dateLabelColor = [UIColor orangeColor];//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    datepicker.doneButtonColor =RGBA(21, 170, 255, 1);//确定按钮的颜色
    
    [datepicker show];
}

#pragma mark=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求
-(void)getToSpendingListRequest
{
    NSMutableDictionary *paramsDic=[NSMutableDictionary dictionary];
    paramsDic[@"deviceId"]=[PSGeneral getLocalData:@"deviceLogoStr"];
    paramsDic[@"time"]=[NSString stringWithFormat:@"%ld,%ld",[PSGeneral timeSwitchTimestamp:self.startTimeLabel.text andFormatter:@"YYYY/MM/dd"],[PSGeneral timeSwitchTimestamp:self.endTimeLabel.text andFormatter:@"YYYY/MM/dd"]];
    HttpTool*request=[HttpTool request];
    
    [SVProgressHUD showWithStatus:@"网络数据加载中"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    __weak typeof(self) WeakSelf=self;
    
    [request post:baseUrl(ieStatistics_Url) parameters:paramsDic swithSucess:^(NSDictionary *dic)
     {
         
         [SVProgressHUD dismiss];
         
         if (dic)
         {
             NSString*msg=VerifyJsonValue(dic[@"msg"]);
             NSInteger status=[VerifyJsonValue(dic[@"status"]) integerValue];
             
             [WeakSelf.numberArray removeAllObjects];
             if (status==0)
             {
                 //金额
                 amountStr=VerifyJsonValue([[dic[@"data"]objectForKey:@"expenses"]objectForKey:@"amount"]);
                 
                 
                 //会员出款
                NSString*memberWithdrawal=VerifyJsonValue([[dic[@"data"]objectForKey:@"expenses"]objectForKey:@"memberWithdrawal"]);
                 
                 NSArray*memberWithdrawalArray=[memberWithdrawal componentsSeparatedByString:@","];
                 WeakSelf.chuKuanYuanLabel.text=[NSString stringWithFormat:@"%@",memberWithdrawalArray[0]];
                 WeakSelf.chuKuanBiLabel.text=[NSString stringWithFormat:@"%@",memberWithdrawalArray[1]];
                 WeakSelf.chuKuanRenLabel.text=[NSString stringWithFormat:@"%@",memberWithdrawalArray[2]];
                 //给予优惠
                NSString*discount=VerifyJsonValue([[dic[@"data"]objectForKey:@"expenses"]objectForKey:@"discount"]);
                 NSArray*discountArray=[discount componentsSeparatedByString:@","];
                 WeakSelf.youHuiYuanLabel.text=[NSString stringWithFormat:@"%@",discountArray[0]];
                 WeakSelf.youHuiBiLabel.text=[NSString stringWithFormat:@"%@",discountArray[1]];
                 WeakSelf.youHuiRenLabel.text=[NSString stringWithFormat:@"%@",discountArray[2]];
                 //系统扣款
                 NSString*systemDeduction=VerifyJsonValue([[dic[@"data"]objectForKey:@"expenses"]objectForKey:@"systemDeduction"]);
                 NSArray*systemDeductionArray=[systemDeduction componentsSeparatedByString:@","];
                 WeakSelf.kouKuanYuanLabel.text=[NSString stringWithFormat:@"%@",systemDeductionArray[0]];
                 WeakSelf.kouKuanBiLabel.text=[NSString stringWithFormat:@"%@",systemDeductionArray[1]];
                 WeakSelf.kouKuanRenLabel.text=[NSString stringWithFormat:@"%@",systemDeductionArray[2]];
                 //给予返水
                 NSString*rebate=VerifyJsonValue([[dic[@"data"]objectForKey:@"expenses"]objectForKey:@"rebate"]);
                 NSArray*rebateArray=[rebate componentsSeparatedByString:@","];
                 WeakSelf.fanShuiYuanLabel.text=[NSString stringWithFormat:@"%@",rebateArray[0]];
                 WeakSelf.fanShuiBiLabel.text=[NSString stringWithFormat:@"%@",rebateArray[1]];
                 WeakSelf.fanShuiRenLabel.text=[NSString stringWithFormat:@"%@",rebateArray[2]];
              
                 
                 
                 [WeakSelf.numberArray addObject:memberWithdrawalArray[0]];
                 [WeakSelf.numberArray  addObject:discountArray[0]];
                 [WeakSelf.numberArray  addObject:systemDeductionArray[0]];
                 [WeakSelf.numberArray  addObject:rebateArray[0]];
                 
                 
                 //创建图标
                 [WeakSelf createCircleView];
                 
             }else
             {
                 [SVProgressHUD showErrorWithStatus:msg];
             }
             
         }
     } withFailed:^(NSString *error, int status) {
         
         
         [SVProgressHUD dismiss];
         [SVProgressHUD showErrorWithStatus:error];
         
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
