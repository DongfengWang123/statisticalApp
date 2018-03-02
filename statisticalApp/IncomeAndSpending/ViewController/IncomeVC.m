//
//  IncomeVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "IncomeVC.h"

#import "JXCircleModel.h"
#import "JXCircleRatioView.h"
#define PIE_HEIGHT  250
#define Radius 100.5 //圆形比例图的半径
@interface IncomeVC ()
@property(nonatomic, strong) JXCircleRatioView *circleView;
@property(nonatomic, strong) NSMutableArray *dataArray;
@property(nonatomic, strong) NSMutableArray *numberArray;
@end

@implementation IncomeVC

{
  
    NSString*amountStr;
  
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

 
    
    self.scrollowHeightConstraint.constant=45+PIE_HEIGHT+55*5;

    self.startTimeLabel.text=[PSGeneral getNowYearDateFormat:@"YYYY/MM/dd"];
    self.endTimeLabel.text=[PSGeneral GetTomorrowDay:[PSGeneral nsstringConversionDateFormat:@"YYYY/MM/dd" datestring:[PSGeneral getNowYearDateFormat:@"YYYY/MM/dd"]]];
    

    
    //获取数据请求
    [self  getToIncomeListRequest];
    
    
}
-(NSMutableArray*)numberArray
{
    if (!_numberArray)
    {
        _numberArray=[NSMutableArray array];
    }
    
    return _numberArray;
}
-(void)createDataArray
{
    
    _dataArray = [NSMutableArray array];
    [_dataArray removeAllObjects];

   
    NSArray *colors = @[RGBA(202, 220, 84,1),RGBA(233, 107, 104,1),RGBA(250, 185, 109,1),RGBA(106, 105, 240,1),RGBA(110, 238, 195,1)];
     
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
    _circleView.shouRuLabelStr=@"总收入";
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
        [self  getToIncomeListRequest];
        
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
        [self  getToIncomeListRequest];
        
    }];
    datepicker.dateLabelColor = [UIColor orangeColor];//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    datepicker.doneButtonColor = RGBA(21, 170, 255, 1);//确定按钮的颜色
   
    [datepicker show];

}



#pragma mark=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求
-(void)getToIncomeListRequest
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
                amountStr=VerifyJsonValue([[dic[@"data"]objectForKey:@"income"]objectForKey:@"amount"]);
              
                
                //公司入账
            NSString*companyDeposit=VerifyJsonValue([[dic[@"data"]objectForKey:@"income"]objectForKey:@"companyDeposit"]);
                
                NSArray*companyDepositArray=[companyDeposit componentsSeparatedByString:@","];
                WeakSelf.ruZhangYuanLabel.text=[NSString stringWithFormat:@"%@",companyDepositArray[0]];
                WeakSelf.ruZhangBiLabel.text=[NSString stringWithFormat:@"%@",companyDepositArray[1]];
                WeakSelf.ruZhangRenLabel.text=[NSString stringWithFormat:@"%@",companyDepositArray[2]];
                //线上支付
                NSString*onlinePay=VerifyJsonValue([[dic[@"data"]objectForKey:@"income"]objectForKey:@"onlinePay"]);
                NSArray*onlinePayArray=[onlinePay componentsSeparatedByString:@","];
                WeakSelf.zhiFuYuanLabel.text=[NSString stringWithFormat:@"%@",onlinePayArray[0]];
                WeakSelf.zhiFuBiLabel.text=[NSString stringWithFormat:@"%@",onlinePayArray[1]];
                WeakSelf.zhiFuRenLabel.text=[NSString stringWithFormat:@"%@",onlinePayArray[2]];
                //普通转账
                NSString*transfer=VerifyJsonValue([[dic[@"data"]objectForKey:@"income"]objectForKey:@"transfer"]);
                  NSArray*transferArray=[transfer componentsSeparatedByString:@","];
                WeakSelf.zhuangZhuangYuanLabel.text=[NSString stringWithFormat:@"%@",transferArray[0]];
                WeakSelf.zhuangZhuangBiLabel.text=[NSString stringWithFormat:@"%@",transferArray[1]];
                WeakSelf.zhuangZhuangRenLabel.text=[NSString stringWithFormat:@"%@",transferArray[2]];
                //异常补偿
                NSString*makeUp=VerifyJsonValue([[dic[@"data"]objectForKey:@"income"]objectForKey:@"makeUp"]);
                 NSArray*makeUpArray=[makeUp componentsSeparatedByString:@","];
                WeakSelf.buChangYuanLabel.text=[NSString stringWithFormat:@"%@",makeUpArray[0]];
                WeakSelf.buChangBiLabel.text=[NSString stringWithFormat:@"%@",makeUpArray[1]];
                WeakSelf.buChangRenLabel.text=[NSString stringWithFormat:@"%@",makeUpArray[2]];
                //代理佣金
            NSString*proxyCommission=VerifyJsonValue([[dic[@"data"]objectForKey:@"income"]objectForKey:@"proxyCommission"]);
                 NSArray*proxyCommissionArray=[proxyCommission componentsSeparatedByString:@","];
                WeakSelf.yongJinYuanLabel.text=[NSString stringWithFormat:@"%@",proxyCommissionArray[0]];
                WeakSelf.yongJinBiLabel.text=[NSString stringWithFormat:@"%@",proxyCommissionArray[1]];
                WeakSelf.yongJinRenLabel.text=[NSString stringWithFormat:@"%@",proxyCommissionArray[2]];
                
                
                [WeakSelf.numberArray addObject:companyDepositArray[0]];
                [WeakSelf.numberArray  addObject:onlinePayArray[0]];
                [WeakSelf.numberArray  addObject:transferArray[0]];
                [WeakSelf.numberArray  addObject:makeUpArray[0]];
                [WeakSelf.numberArray  addObject:proxyCommissionArray[0]];
                
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
