//
//  SecurityCodeView.m
//  GraphCheckCode
//
//  Created by zds on 16/6/8.
//  Copyright © 2016年 com.zdsoft. All rights reserved.
//

#import "SecurityCodeView.h"

#define kRandomColor  [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1.0];
#define kLineCount 6
#define kLineWidth 1.0
#define kCharCount 4
#define kFontSize [UIFont systemFontOfSize:arc4random() % 5 + 15]

@interface SecurityCodeView ()
{
    ///验证码字符串
    NSString *SecurityCodeStr;
    
    ///验证码数组
    NSMutableArray *SecurityCodeArray;
}
@end

@implementation SecurityCodeView

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        SecurityCodeArray = [[NSMutableArray alloc]init];
        
        [self setBackgroundColor:[UIColor lightGrayColor]];
    }
    return self;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
   
}

-(void)drawRect:(CGRect)rect
{
    
    //设置随机背景颜色
    self.backgroundColor = kRandomColor;
    
    [SecurityCodeArray removeAllObjects];
    
    ///注意可以使用另外一种方式将所有预先要使用到的字符加入数组中然后产生随机数，获取其中四个
    while ([SecurityCodeArray count]<=4) {
        int b = arc4random() % 121;
        if ((b>=48&&b<=57)) {
            [SecurityCodeArray addObject:[NSString stringWithFormat:@"%c",b]];
        }
        if (b>=65&&b<=89) {
            [SecurityCodeArray addObject:[NSString stringWithFormat:@"%c",b]];
        }
        if (b>=97&&b<=121) {
            [SecurityCodeArray addObject:[NSString stringWithFormat:@"%c",b]];
        }
        if ([SecurityCodeArray count]==4) {
            SecurityCodeStr = @"";
            for (NSString *s in SecurityCodeArray) {
                SecurityCodeStr = [NSString stringWithFormat:@"%@%@",SecurityCodeStr,s];
            }
        }
    }
    
    if (self.securityStr) {
        self.securityStr(SecurityCodeStr);
    }
    
    CGSize cSize = [@"S" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    int width = rect.size.width / SecurityCodeStr.length - cSize.width;
    int height = rect.size.height - cSize.height;
    CGPoint point;
    
    //依次绘制每一个字符,可以设置显示的每个字符的字体大小、颜色、样式等
    float pX, pY;
    for (int i = 0; i < SecurityCodeStr.length; i++)
    {
        pX = arc4random() % width + rect.size.width / SecurityCodeStr.length * i;
        pY = arc4random() % height;
        point = CGPointMake(pX, pY);
        unichar c = [SecurityCodeStr characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        
        [textC drawAtPoint:point withAttributes:@{NSFontAttributeName:kFontSize}];
    }
    
    //调用drawRect：之前，系统会向栈中压入一个CGContextRef，调用UIGraphicsGetCurrentContext()会取栈顶的CGContextRef
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置画线宽度
    CGContextSetLineWidth(context, kLineWidth);
    
    //绘制干扰的彩色直线
    for(int i = 0; i < kLineCount; i++)
    {
        //设置线的随机颜色
        UIColor *color = kRandomColor;
        CGContextSetStrokeColorWithColor(context, [color CGColor]);
        //设置线的起点
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextMoveToPoint(context, pX, pY);
        //设置线终点
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        //画线
        CGContextStrokePath(context);
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
