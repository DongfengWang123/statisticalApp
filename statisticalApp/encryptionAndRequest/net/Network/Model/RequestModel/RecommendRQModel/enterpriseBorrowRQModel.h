//
//  enterpriseBorrowRQModel.h
//  longeapp
//
//  Created by zds on 16/5/9.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

/*
 
 //必传参数
 [pshttp addParameters:[PSGeneral getLocalData:@"memberId"] forKey:@"memberId"];//会员ID
 [pshttp addParameters:model.companyName forKey:@"companyNm"];//公司名称
 [pshttp addParameters:model.companyPhone forKey:@"mobile"];//联系电话
 [pshttp addParameters:model.borrowAmount forKey:@"borrowAmount"];//借款金额
 [pshttp addParameters:model.borrowPeriod forKey:@"period"];//借款期限
 [pshttp addParameters:@"2" forKey:@"periodType"];//借款期限类型(默认为月，periodType=2)
 //可传参数
 [pshttp addParameters:model.legalPerson forKey:@"legalRepresentative"];//法人代表名称
 [pshttp addParameters:model.orgaCode forKey:@"organizationCd"];//组织机构代码
 [pshttp addParameters:model.capital forKey:@"registeredCapital"];//注册资本金
 [pshttp addParameters:model.totalScale forKey:@"totalAssets"];//总资产规模
 [pshttp addParameters:model.yearScale forKey:@"annualSalesVolume"];//年销售规模
 [pshttp addParameters:model.profitYear forKey:@"operatingLife"];//企业连续盈利年限
 [pshttp addParameters:model.borrowPurpose forKey:@"borrowReason"];//借款原因
 [pshttp addParameters:model.protectDesc forKey:@"safeguardDesc"];//担保措施描述
 [pshttp addParameters:model.protectMethod forKey:@"safeguard"];//担保措施
 
 */

@interface enterpriseBorrowRQModel : BaseModel

///会员ID
@property(nonatomic,copy)NSString *memberId;

///公司名称
@property(nonatomic,copy)NSString *companyNm;

///联系电话
@property(nonatomic,copy)NSString *mobile;

///借款金额
@property(nonatomic,copy)NSString *borrowAmount;

///借款期限
@property(nonatomic,copy)NSString *period;

///借款期限类型
@property(nonatomic,copy)NSString *periodType;

///法人代表名称
@property(nonatomic,copy)NSString *legalRepresentative;

///组织机构代码
@property(nonatomic,copy)NSString *organizationCd;

///注册资本金
@property(nonatomic,copy)NSString *registeredCapital;

///总资产规模
@property(nonatomic,copy)NSString *totalAssets;

///年销售规模
@property(nonatomic,copy)NSString *annualSalesVolume;

///企业连续盈利年限
@property(nonatomic,copy)NSString *operatingLife;

///借款原因
@property(nonatomic,copy)NSString *borrowReason;

///担保措施描述
@property(nonatomic,copy)NSString *safeguardDesc;

///担保措施
@property(nonatomic,copy)NSString *safeguard;
@end
