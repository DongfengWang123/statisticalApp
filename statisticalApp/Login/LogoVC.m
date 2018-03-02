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
#import "NSString+MD5.h"
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
    
    [self getToShenBeiShenQingRequest];

}


#pragma mark=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求
//设备申请
-(void)getToShenBeiShenQingRequest
{
    NSMutableDictionary *paramsDic=[NSMutableDictionary dictionary];
    paramsDic[@"deviceId"]=[[self getDeviceId]MD5] ;
    paramsDic[@"code"]=self.IdentificationCodeStr;
    HttpTool*request=[HttpTool request];
    
    [SVProgressHUD showWithStatus:@"网络数据加载中"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    [request post:baseUrl(deviceApply_Url) parameters:paramsDic swithSucess:^(NSDictionary *dic) {
        [SVProgressHUD dismiss];
        if (dic)
        {
            NSString*msg=VerifyJsonValue(dic[@"msg"]);
            NSInteger status=[VerifyJsonValue(dic[@"status"]) integerValue];
            if (status==0)
            {
                
                [PSGeneral showInfo:@"申请成功,待管理员审核通过以后,请重新登录"];
                
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
