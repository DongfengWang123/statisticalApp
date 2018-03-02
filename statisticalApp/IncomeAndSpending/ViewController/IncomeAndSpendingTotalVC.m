//
//  IncomeAndSpendingTotalVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "IncomeAndSpendingTotalVC.h"
#import "IncomeVC.h"
#import "SpendingVC.h"
@interface IncomeAndSpendingTotalVC ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView*backgroundScrollView;
@property(nonatomic,strong)UISegmentedControl*segmentedControl;
@property(nonatomic,strong)IncomeVC*incomeVC;
@property(nonatomic,strong)SpendingVC*spendingVC;

@end

@implementation IncomeAndSpendingTotalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self backgroundScrollView];//创建scrollView
    
    
     [self setupChildViewControll];//设置每一个子控制器
    
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"收入",@"支出",nil];
    _segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    _segmentedControl.frame = CGRectMake(20.0, 20.0, 150.0, 30.0);
    _segmentedControl.selectedSegmentIndex = 0;//设置默认选择项索引
    _segmentedControl.tintColor = [UIColor whiteColor];
    if ([[[UIDevice currentDevice]systemVersion] integerValue]<7.0)
    {
        _segmentedControl.segmentedControlStyle =UISegmentedControlStyleBordered;//设置样式
    }
    [_segmentedControl addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView=_segmentedControl;
    

    
}

//创建scrollView
-(UIScrollView*)backgroundScrollView
{
    if (!_backgroundScrollView)
    {
        _backgroundScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, total_WIDTH, total_HEIGHT-55-64)];
        _backgroundScrollView.contentSize=CGSizeMake(total_WIDTH*2, total_HEIGHT-55-64);
        _backgroundScrollView.backgroundColor=[UIColor clearColor];
        _backgroundScrollView.delegate=self;
        //    是否显示横向滚动条
        _backgroundScrollView.showsHorizontalScrollIndicator = NO;
        _backgroundScrollView.pagingEnabled=YES;
        _backgroundScrollView.bounces=NO;
        [self.view addSubview:_backgroundScrollView];
    }
    
    return _backgroundScrollView;
}

//设置每一个子控制器
-(void)setupChildViewControll
{
    self.incomeVC=[[IncomeVC alloc]init];
    self.spendingVC=[[SpendingVC alloc]init];
    //    指定改控制器为子控制器
    [self addChildViewController:_incomeVC];
    [self addChildViewController:_spendingVC];
    //    将试图添加到backgroundScrollView上
    [_backgroundScrollView addSubview:_incomeVC.view];
    [_backgroundScrollView addSubview:_spendingVC.view];
    //    设置两个控制器的尺寸
    _incomeVC.view.frame=CGRectMake(0, 0, total_WIDTH, total_HEIGHT-55-64);
    _spendingVC.view.frame=CGRectMake(total_WIDTH, 0, total_WIDTH, total_HEIGHT-55-64);
}

//segmen控件按钮绑定的方法
- (void)segmentClick:(UISegmentedControl *)sender
{
    NSInteger index = sender.selectedSegmentIndex;
    CGRect frame = _backgroundScrollView.frame;
    frame.origin.x = index * CGRectGetWidth(_backgroundScrollView.bounds);
    frame.origin.y = 0;
    [_backgroundScrollView scrollRectToVisible:frame animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger ratio = round(offSetX / total_WIDTH);
    _segmentedControl.selectedSegmentIndex = ratio;
}

//统计按钮绑定的方法
- (IBAction)tongJiBtnClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:NO];
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
