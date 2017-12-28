//
//  ADRCModel.h
//  longeapp
//
//  Created by zds on 16/5/6.
//  Copyright © 2016年 YangHong. All rights reserved.
//

#import "BaseModel.h"

@interface ADRCModel : BaseModel
///图片名
@property(nonatomic,copy)NSString *attachmentNm;

///图片地址
@property(nonatomic,copy)NSString *attachmentPath;

///名称
@property(nonatomic,copy)NSString *slideTitle;

@end
