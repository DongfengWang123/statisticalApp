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
@end

@implementation HomePageVC
{
    NSMutableArray*imageArray;
    NSMutableArray*nameArray;
    NSMutableArray*numArray;
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
    
    UICollectionViewFlowLayout*layout=[[UICollectionViewFlowLayout alloc]init];
    //同一行相邻两个cell的最小间距
    layout.minimumInteritemSpacing =1;
    //最小两行之间的间距
    layout.minimumLineSpacing =1;
    //设置collectionView滚动方向
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0,0, total_WIDTH,total_HEIGHT-45-64) collectionViewLayout:layout];
    _collectionView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
    
    _collectionView.showsVerticalScrollIndicator=NO;
    _collectionView.bounces=NO;
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
    nameArray=[[NSMutableArray alloc]initWithObjects:@"入款申请",@"出款申请",@"今日注册",@"在线玩玩",@"新充人数",@"总充人数",@"在线会员",@"在线代理", nil];
    numArray=[[NSMutableArray alloc]initWithObjects:@"7",@"13",@"2",@"0",@"2",@"18",@"1",@"1", nil];
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
        listCell.downLabel.text=numArray[indexPath.item];
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
