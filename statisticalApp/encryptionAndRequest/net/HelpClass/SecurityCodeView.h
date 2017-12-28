//
//  SecurityCodeView.h
//  GraphCheckCode
//
//  Created by zds on 16/6/8.
//  Copyright © 2016年 com.zdsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecurityCodeView : UIView

@property(nonatomic,copy)void(^securityStr)(NSString *str);

@end
