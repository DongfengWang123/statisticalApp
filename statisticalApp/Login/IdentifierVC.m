//
//  IdentifierVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "IdentifierVC.h"
#import "LogoVC.h"
@interface IdentifierVC ()

@end

@implementation IdentifierVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.navigationController.navigationBarHidden=YES;
    [self.navigationItem setHidesBackButton:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    self.navigationController.navigationBarHidden=NO;
    [self.navigationItem setHidesBackButton:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//确认按钮绑定的方法
- (IBAction)sureBtnClick:(UIButton *)sender
{
    
    LogoVC*VC=[[LogoVC alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
    
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
