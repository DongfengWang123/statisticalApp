//
//  UIWebView+extention.h
//  CSRequest
//
//  Created by zds on 16/4/14.
//  Copyright © 2016年 zds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (extention)

///加载PDF文档
-(void)loadPdf:(NSData *)data;

///加载Doc文档
-(void)loadDoc:(NSData *)data;

///加载TXT文档
-(void)loadTxt:(NSData *)data;
@end
