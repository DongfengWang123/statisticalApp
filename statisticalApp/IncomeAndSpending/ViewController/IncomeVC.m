//
//  IncomeVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "IncomeVC.h"
#import "dateView.h"
#import "JXCircleModel.h"
#import "JXCircleRatioView.h"
#define PIE_HEIGHT  250
#define Radius 100.5 //圆形比例图的半径
@interface IncomeVC ()<dateViewDelegate>
@property(nonatomic, strong) JXCircleRatioView *circleView;
@property(nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation IncomeVC

{
    dateView *dateview;
  
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

   
        self.scrollowHeightConstraint.constant=45*2+64+PIE_HEIGHT+45*5;
    
    
    
    
    self.startTimeLabel.text=[PSGeneral getNowYearDateFormat:@"YYYY/MM/dd"];
    self.endTimeLabel.text=[PSGeneral GetTomorrowDay:[PSGeneral nsstringConversionDateFormat:@"YYYY/MM/dd" datestring:[PSGeneral getNowYearDateFormat:@"YYYY/MM/dd"]]];
    
    //添加圆形比例图
    [self.scrollowBgView addSubview:self.circleView];
    
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        
        NSArray *colors = @[RGBA(202, 220, 84,1),RGBA(233, 107, 104,1),RGBA(250, 185, 109,1),RGBA(106, 105, 240,1),RGBA(110, 238, 195,1)];
        NSArray *numbers = @[@"100",@"200",@"50",@"30",@"20"];
        NSArray *names = @[@"担保产品",@"粤财汇",@"信托产品",@"投资",@"资产产品"];
        
        
        for (int i = 0; i < numbers.count; i++) {
            JXCircleModel *model = [[JXCircleModel alloc]init];
            model.color = colors[i];
            model.number = numbers[i];
            model.name = names[i];
            
            
            
            [_dataArray  addObject:model];
        }
        
    }
    return _dataArray;
}

- (JXCircleRatioView *)circleView
{
    if (!_circleView) {
        
        _circleView = [[JXCircleRatioView alloc]initWithFrame:CGRectMake(0, 0,total_WIDTH, PIE_HEIGHT)  andDataArray:self.dataArray CircleRadius:Radius];
        _circleView.backgroundColor = [UIColor whiteColor];
        _circleView.shouRuNumStr=@"1000";
    }
    return _circleView;
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
