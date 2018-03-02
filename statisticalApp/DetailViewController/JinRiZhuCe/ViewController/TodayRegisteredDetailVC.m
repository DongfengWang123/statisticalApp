//
//  TodayRegisteredDetailVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "TodayRegisteredDetailVC.h"

@interface TodayRegisteredDetailVC ()
@end

@implementation TodayRegisteredDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title=@"详情";

    [self getUserDetailRequest];//对详细信息进行请求
}


#pragma mark------网络数据请求------网络数据请求------网络数据请求------网络数据请求------网络数据请求------网络数据请求------网络数据请求

//对详细信息进行请求
-(void)getUserDetailRequest
{
  
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"deviceId"]=[PSGeneral getLocalData:@"deviceLogoStr"];
    params[@"userId"]=self.selectUserId;
    HttpTool*request=[HttpTool request];
    
    [SVProgressHUD showWithStatus:@"网络数据加载中"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    __weak typeof(self) weakSelf =self;
    [request post:baseUrl(getUserInfo_Url) parameters:params swithSucess:^(NSDictionary *dic) {
        
        
        [SVProgressHUD dismiss];
        if (dic)
        {
            NSString*msg=VerifyJsonValue(dic[@"msg"]);
            NSInteger status=[VerifyJsonValue(dic[@"status"]) integerValue];
            
            if (status==0)
            {
                
                NSMutableDictionary*dataDic=VerifyJsonValue(dic[@"data"]);
                
                weakSelf.shangJiGuanXiLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"superior"])];
                weakSelf.zhenShiNameLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"userName"])];
                weakSelf.yongHuZhangHaoLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"accountName"])];
                weakSelf.zhangHuYuELabel.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"surpluAsmount"])]]];
                weakSelf.dongJieJinELabel.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"freezeAmount"])]]];
                weakSelf.yuEZhuanZhangLabel.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"transferAmount"])]]];
                weakSelf.xiaoXiFaSongLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"newsSum"])];
                weakSelf.maxFanDianLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"rebate"])];
                weakSelf.liuHeCaiFanDianLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"lhcRebate"])];
                weakSelf.zhangHaoDongJieLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"freezeState"])];
                weakSelf.zhangHaoLeiXingLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"accountType"])];
                weakSelf.ShouJiHaoLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"phoneNumber"])];
                weakSelf.youXiangDiZhiLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"email"])];
                weakSelf.qqNumLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"qqNumber"])];
                weakSelf.zhuCeIPLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"registerIp"])];
                weakSelf.zhuCeTimeLabel.text=[NSString stringWithFormat:@"%@",[PSGeneral getTimeWithTimestamp:VerifyJsonValue(dataDic[@"registerTime"]) withFormatterStyle:@"YYYY-MM-dd HH:mm:ss"]];
                weakSelf.loginIPLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"loginIp"])];
                weakSelf.loginTimeLabel.text=[NSString stringWithFormat:@"%@",[PSGeneral getTimeWithTimestamp:VerifyJsonValue(dataDic[@"loginTime"]) withFormatterStyle:@"YYYY-MM-dd HH:mm:ss"]];
                
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
