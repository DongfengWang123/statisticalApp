//
//  LogoVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "LogoVC.h"
#import "HomePageVC.h"
//钥匙串+UUID
#import "SSKeychain.h"
@interface LogoVC ()

@end

@implementation LogoVC
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
    
    self.biaoShiFuLabel.text=[self getDeviceId];
}

/******** 设备唯一标识 *********/

-(NSString *)getDeviceId
{
    
    //初始化
    static NSString *kSSToolkitServiceName = @"com.company.statisticalApp";
    static NSString *kSSToolkitAccountName = @"uuid";
    
    //从SSKeychain取出UUID(先取)
    NSString * currentDeviceUUIDStr = [SSKeychain passwordForService:kSSToolkitServiceName account:kSSToolkitAccountName];
    if (currentDeviceUUIDStr == nil || [currentDeviceUUIDStr isEqualToString:@""])
    {
        //正常获取UDID
        NSUUID * currentDeviceUUID  = [UIDevice currentDevice].identifierForVendor;
        currentDeviceUUIDStr = currentDeviceUUID.UUIDString;
        //将里面的"-"去掉
        currentDeviceUUIDStr = [currentDeviceUUIDStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
        //将最好得到的值转化为小写字母
        currentDeviceUUIDStr = [currentDeviceUUIDStr lowercaseString];
        
        //将得到的值保存起来
        [SSKeychain setPassword: currentDeviceUUIDStr forService:kSSToolkitServiceName account:kSSToolkitAccountName];
    }
    return currentDeviceUUIDStr;
}


//确认按钮绑定的方法
- (IBAction)sureBtnClick:(UIButton *)sender
{
    HomePageVC*VC=[[HomePageVC alloc]init];
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
