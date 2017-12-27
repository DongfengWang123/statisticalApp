//
//  CustomNavigationVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/20.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "CustomNavigationVC.h"

@interface CustomNavigationVC ()

@end

@implementation CustomNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
 
    self.navigationBar.barTintColor=[[UIColor alloc]initWithRed:21/255.0 green:170/255.0 blue:255/255.0 alpha:1];
    self.navigationBar.translucent =NO;
    [self.navigationBar setBarStyle:UIBarStyleBlack];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0]}];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-190,0) forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTitleTextAttributes:

     @{NSFontAttributeName:[UIFont systemFontOfSize:18],

    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //状态栏设置(背景)
//    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
  
    self.navigationBar.tintColor = [UIColor whiteColor];
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
