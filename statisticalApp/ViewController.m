//
//  ViewController.m
//  statisticalApp
//
//  Created by ybmac on 2017/12/20.
//  Copyright © 2017年 ybmac. All rights reserved.
//

#import "ViewController.h"
#import "CustomNavigationVC.h"
#import "HomePageVC.h"
#import "IdentifierVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    IdentifierVC*vc=[[IdentifierVC alloc]init];
    CustomNavigationVC*navigationVC=[[CustomNavigationVC alloc]initWithRootViewController:vc];
    UIWindow*window=[UIApplication sharedApplication].delegate.window;
    window.rootViewController=navigationVC;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
