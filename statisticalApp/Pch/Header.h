//
//  Header.h
//  statisticalApp
//
//  Created by ybmac on 2017/12/20.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#ifndef Header_h
#define Header_h


///接口根地址（正式中转地址-->更换服务器）
#define baseUrl(jointUrl) [NSString stringWithFormat:@"http://192.168.1.128/index.php/LottInterface/%@",jointUrl]

///1、登录接口
#define Login_Url @"/login?"

#endif /* Header_h */
