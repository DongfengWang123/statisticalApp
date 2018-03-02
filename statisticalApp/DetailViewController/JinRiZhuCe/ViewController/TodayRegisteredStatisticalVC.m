//
//  TodayRegisteredStatisticalVC.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/25.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "TodayRegisteredStatisticalVC.h"
#import "TodayRegisteredDetailCell.h"
@interface TodayRegisteredStatisticalVC ()

@end

@implementation TodayRegisteredStatisticalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title=@"统计";

    [self getUserTongJiRequest];//对统计信息进行数据请求
    
}

#pragma mark------网络数据请求------网络数据请求------网络数据请求------网络数据请求------网络数据请求------网络数据请求------网络数据请求

//对统计信息进行数据请求
-(void)getUserTongJiRequest
{
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"deviceId"]=[PSGeneral getLocalData:@"deviceLogoStr"];
    params[@"userId"]=self.selectStatisticalUserId;
    HttpTool*request=[HttpTool request];
    
    [SVProgressHUD showWithStatus:@"网络数据加载中"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    __weak typeof(self) weakSelf =self;
    
    [request post:baseUrl(getUserStatistical_Url) parameters:params swithSucess:^(NSDictionary *dic) {
        
        [SVProgressHUD dismiss];
        if (dic)
        {
            NSString*msg=VerifyJsonValue(dic[@"msg"]);
            NSInteger status=[VerifyJsonValue(dic[@"status"]) integerValue];
            
            if (status==0)
            {
                 NSMutableDictionary*dataDic=VerifyJsonValue(dic[@"data"]);
                
                weakSelf.userNameLabel.text=[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"accountName"])];
                weakSelf.touZhuZongELabel.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"bttingAmount"])]]];
                weakSelf.zhongJiangZongELabel.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"winAmount"])]]];
                weakSelf.zongFanDianLabel.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"rebateSum"])]]];
                weakSelf.zongYongJinLabel.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"brokerageSum"])]]];
                weakSelf.chongZhiLabel.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"recharge"])]]];
                weakSelf.tiXianLabel.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"withdraw"])]]];
                 weakSelf.yuELabel.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"surpluAsmount"])]]];
                 weakSelf.geRenZongJieSuanLabel.text=[NSString stringWithFormat:@"%@",[PSGeneral changeFloat:[NSString stringWithFormat:@"%@",VerifyJsonValue(dataDic[@"summary"])]]];
                
                
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
