//
//  UIWebView+extention.m
//  CSRequest
//
//  Created by zds on 16/4/14.
//  Copyright © 2016年 zds. All rights reserved.
//

#import "UIWebView+extention.h"

@implementation UIWebView (extention)

#pragma mark --加载PDF文档
-(void)loadPdf:(NSData *)data
{
    [self loadData:data MIMEType:@"application/pdf" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
}

#pragma mark --加载Doc文档
-(void)loadDoc:(NSData *)data
{
     [self loadData:data MIMEType:@"application/vnd.openxmlformats-officedocument.wordprocessingml.document" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
}

#pragma mark --加载本地文本文档
-(void)loadTxt:(NSData *)data
{
    [self loadData:data MIMEType:@"text/plain" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
}

-(void)clearIdentiferLine
{
    
}
@end
