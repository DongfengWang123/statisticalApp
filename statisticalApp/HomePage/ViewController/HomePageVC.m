//
//  HomePageVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/20.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "HomePageVC.h"
#import "HZhangHuCVCell.h"
#import "HListCVCell.h"
#import "RuKuanShenQingListVC.h"
#import "ChuKuanShenQingListVC.h"
#import "TodayRegisteredVC.h"
#import "ZaiXianShiWanVC.h"
#import "IncomeAndSpendingTotalVC.h"
@interface HomePageVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray*numArray;
@end

@implementation HomePageVC
{
    NSMutableArray*imageArray;
    NSMutableArray*nameArray;

}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
  
    [self.navigationItem setHidesBackButton:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
 
    [self.navigationItem setHidesBackButton:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.


    NSLog(@"=====================%f",total_HEIGHT);
    
    [self  getToShuJuTongJiRequest];//获取网络数据请求
    
    UICollectionViewFlowLayout*layout=[[UICollectionViewFlowLayout alloc]init];
    //同一行相邻两个cell的最小间距
    layout.minimumInteritemSpacing =1;
    //最小两行之间的间距
    layout.minimumLineSpacing =1;
    //设置collectionView滚动方向
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0,0, total_WIDTH,total_HEIGHT-55-64) collectionViewLayout:layout];
    _collectionView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
    
    _collectionView.showsVerticalScrollIndicator=NO;
     _collectionView.backgroundColor=[UIColor redColor];
    _collectionView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    [self.view addSubview:_collectionView];
    
    
    /*
     *这是重点 必须注册cell
     */
    UINib*cellOneNib=[UINib nibWithNibName:@"HZhangHuCVCell" bundle:nil];
    [_collectionView registerNib:cellOneNib forCellWithReuseIdentifier:@"HZhangHuCVCell"];
    
    UINib*cellTwoNib=[UINib nibWithNibName:@"HListCVCell" bundle:nil];
    [_collectionView registerNib:cellTwoNib forCellWithReuseIdentifier:@"HListCVCell"];
    
    
    imageArray=[[NSMutableArray alloc]initWithObjects:@"icon_rksq",@"icon_cksq",@"icon_jrzc",@"icon_zxsw",@"icon_xcrs",@"icon_zcrs",@"icon_zxhy",@"icon_zxdl", nil];
    nameArray=[[NSMutableArray alloc]initWithObjects:@"入款申请",@"出款申请",@"今日注册",@"在线试玩",@"新充人数",@"总充人数",@"在线会员",@"在线代理", nil];
    
    
    __weak typeof(self) WeakSelf=self;
    self.collectionView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [WeakSelf  getToShuJuTongJiRequest];
        
    } ];
   
}

-(NSMutableArray*)numArray
{
    if (!_numArray)
    {
        _numArray=[NSMutableArray array];
    }
    
    return _numArray;
}

//返回多少个区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

//每个区返回多少个item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 1;
    }else
    {
        return 8;
    }
}

- (UICollectionViewCell* )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        HZhangHuCVCell*zhangHuCell=[collectionView dequeueReusableCellWithReuseIdentifier:@"HZhangHuCVCell" forIndexPath:indexPath];
        zhangHuCell.zhangHuJinELabelNum.text=[NSString stringWithFormat:@"%@",_numArray[0]];
        [zhangHuCell.zhangHuJinEBtn addTarget:self action:@selector(zhangHuJinEBtnClick) forControlEvents:UIControlEventTouchUpInside];
        return zhangHuCell;
    }else
    {
        HListCVCell*listCell=[collectionView dequeueReusableCellWithReuseIdentifier:@"HListCVCell" forIndexPath:indexPath];
        if (indexPath.item<=1)
        {
            listCell.unitLabel.text=@"笔";
        }else
        {
             listCell.unitLabel.text=@"人";
        }
        listCell.leftUpImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArray[indexPath.item]]];
        listCell.rightUplabel.text=nameArray[indexPath.item];
        listCell.downLabel.text=[NSString stringWithFormat:@"%@",_numArray[indexPath.item+1]];
        return listCell;
    }
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
         return CGSizeMake(total_WIDTH,200);
    }else
    {
        return CGSizeMake((total_WIDTH-1)/2.0,150);
    }
}

//选中某一行绑定的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1)
    {
        if (indexPath.item==0)
        {
            RuKuanShenQingListVC*vc=[[RuKuanShenQingListVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.item==1)
        {
            ChuKuanShenQingListVC*vc=[[ChuKuanShenQingListVC alloc]init];
             [self.navigationController pushViewController:vc animated:YES];
        }else  if (indexPath.item==2)
        {
            TodayRegisteredVC*vc=[[TodayRegisteredVC alloc]init];
            vc.ItemStr=nameArray[indexPath.item];
            [self.navigationController pushViewController:vc animated:YES];
            
        }else  if (indexPath.item==3)
        {
            TodayRegisteredVC*vc=[[TodayRegisteredVC alloc]init];
            vc.ItemStr=nameArray[indexPath.item];
            [self.navigationController pushViewController:vc animated:YES];
            
        }else  if (indexPath.item==4)
        {
            TodayRegisteredVC*vc=[[TodayRegisteredVC alloc]init];
            vc.ItemStr=nameArray[indexPath.item];
            [self.navigationController pushViewController:vc animated:YES];
            
        }else  if (indexPath.item==5)
        {
            TodayRegisteredVC*vc=[[TodayRegisteredVC alloc]init];
            vc.ItemStr=nameArray[indexPath.item];
            [self.navigationController pushViewController:vc animated:YES];
            
        }else  if (indexPath.item==6)
        {
            TodayRegisteredVC*vc=[[TodayRegisteredVC alloc]init];
            vc.ItemStr=nameArray[indexPath.item];
            [self.navigationController pushViewController:vc animated:YES];
            
        }else  if (indexPath.item==7)
        {
            TodayRegisteredVC*vc=[[TodayRegisteredVC alloc]init];
            vc.ItemStr=nameArray[indexPath.item];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
    }
   
}
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    if (section==0)
//    {
//        return UIEdgeInsetsMake(0, 0, 0, 0);
//    }else
//    {
//        return UIEdgeInsetsMake(0, 0, 0, 0);
//    }
//}


- (IBAction)IncomeAndSpendingBtnClick:(UIButton *)sender
{
    
    IncomeAndSpendingTotalVC*vc=[[IncomeAndSpendingTotalVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)zhangHuJinEBtnClick
{
   UIAlertController*alertController=[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"账户余额计算公式=公司入款+线上支付+代理佣金+普通转账-会员出款-系统扣款" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    } ]];
    
     [self presentViewController:alertController animated:YES completion:nil];
    
}
#pragma mark=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求

//获取数据统计网络请求
-(void)getToShuJuTongJiRequest
{
     NSMutableDictionary *paramsDic=[NSMutableDictionary dictionary];
    paramsDic[@"deviceId"]=[PSGeneral getLocalData:@"deviceLogoStr"];
    
    HttpTool*request=[HttpTool request];
    
    [SVProgressHUD showWithStatus:@"网络数据加载中"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    __weak typeof(self) WeakSelf=self;
    [request post:baseUrl(appStatistics_Url) parameters:paramsDic swithSucess:^(NSDictionary *dic) {
        
        [SVProgressHUD dismiss];
        [WeakSelf.collectionView.mj_header endRefreshing];
        if (dic)
        {
            NSString*msg=VerifyJsonValue(dic[@"msg"]);
            NSInteger status=[VerifyJsonValue(dic[@"status"]) integerValue];
            
            if (status==0)
            {
                //账户金额
                NSString*amount=VerifyJsonValue([dic[@"data"]objectForKey:@"amount"]);
                //入款申请
                NSString*deposit=VerifyJsonValue([dic[@"data"]objectForKey:@"deposit"]);
                //出款申请
                NSString*withdrawal=VerifyJsonValue([dic[@"data"]objectForKey:@"withdrawal"]);
                //在线注册
                NSString*registered=VerifyJsonValue([dic[@"data"]objectForKey:@"registered"]);
                //在线试玩
                NSString*tryPlay=VerifyJsonValue([dic[@"data"]objectForKey:@"tryPlay"]);
                //新充人数
                NSString*newRecharge=VerifyJsonValue([dic[@"data"]objectForKey:@"newRecharge"]);
                //总充人数
                NSString*allRecharge=VerifyJsonValue([dic[@"data"]objectForKey:@"allRecharge"]);
                //在线会员
                NSString*onlineMember=VerifyJsonValue([dic[@"data"]objectForKey:@"onlineMember"]);
                //在线代理
                NSString*onlineProxy=VerifyJsonValue([dic[@"data"]objectForKey:@"onlineProxy"]);
                [WeakSelf.numArray addObject:amount];
                [WeakSelf.numArray addObject:deposit];
                [WeakSelf.numArray addObject:withdrawal];
                [WeakSelf.numArray addObject:registered];
                [WeakSelf.numArray addObject:tryPlay];
                [WeakSelf.numArray addObject:newRecharge];
                [WeakSelf.numArray addObject:allRecharge];
                [WeakSelf.numArray addObject:onlineMember];
                [WeakSelf.numArray addObject:onlineProxy];
                
                [_collectionView reloadData];
                
            }else
            {
                [SVProgressHUD showErrorWithStatus:msg];
            }
        }
    } withFailed:^(NSString *error, int status) {
         [WeakSelf.collectionView.mj_header endRefreshing];
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
