//
//  IdentifierVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "IdentifierVC.h"
#import "LogoVC.h"
#import "NSString+MD5.h"
//钥匙串+UUID
#import "SSKeychain.h"
#import "HomePageVC.h"
@interface IdentifierVC ()<UITextFieldDelegate>

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
    
    self.textFiledView.layer.borderWidth=1.0;
    self.textFiledView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.IdentificationCodeTextField.delegate=self;
    //保存设备唯一标识,方便以后请求时候取值
    NSString*deviceIdStr=[[self getDeviceId]MD5];
    if (deviceIdStr)
    {
        [PSGeneral saveLocalData:deviceIdStr forKey:@"deviceLogoStr"];
    }
}

//确认按钮绑定的方法
- (IBAction)sureBtnClick:(UIButton *)sender
{
    
    if (self.IdentificationCodeTextField.text.length==0)
    {
        self.textFiledView.layer.borderColor=[UIColor redColor].CGColor;
        self.IdentificationCodeTextField.placeholder=@"识别码输入错误";
        [self.IdentificationCodeTextField setBackgroundColor:RGBA(250, 255, 189, 1)];
        return;
    }
    [self  yanZhengMaRequest];

    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField setBackgroundColor:RGBA(250, 255, 189, 1)];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.textFiledView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.IdentificationCodeTextField.placeholder=@"请输入您的识别码";
    [textField setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求=======网络数据请求

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

//验证码请求
-(void)yanZhengMaRequest
{
    HttpTool*request=[HttpTool request];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"code"]=[self.IdentificationCodeTextField.text MD5];
    params[@"deviceId"]=[[self getDeviceId]MD5];
    
    [SVProgressHUD showWithStatus:@"网络数据加载中"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [request post:baseUrl(verify_Url) parameters:params swithSucess:^(NSDictionary *dic)
    {
        [SVProgressHUD dismiss];
        if (dic)
        {
            NSString*msg=VerifyJsonValue(dic[@"msg"]);
            NSInteger status=[VerifyJsonValue(dic[@"status"]) integerValue];
            if (status==0)
            {
                NSString*deviceIdStr=VerifyJsonValue([dic[@"data"]objectForKey:@"deviceId"]);
                
                NSString*getDeviceIdStr=[[self getDeviceId]MD5];
                if ([deviceIdStr isEqualToString:getDeviceIdStr])
                {
                    //成功的时候跳转到统计页面
                    HomePageVC*VC=[[HomePageVC alloc]init];
                    [self.navigationController pushViewController:VC animated:YES];
                    
                }else
                {
                    //成功的时候跳转到下一界面
                    LogoVC*VC=[[LogoVC alloc]init];
                    VC.IdentificationCodeStr=[self.IdentificationCodeTextField.text MD5];
                    [self.navigationController pushViewController:VC animated:YES];
                }
            
            }else if (status==2)
            {
                [PSGeneral showInfo:@"身份正在审核中,请稍后重新登录!"];
            }
            else
            {
                [SVProgressHUD showErrorWithStatus:msg];
            }
        }
        
    } withFailed:^(NSString *error, int status) {
        
         [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:error];
    
    } ];
    
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
