//
//  BIMyPersonViewController.m
//  Bike
//
//  Created by kyu on 15/4/16.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIMyPersonViewController.h"

@implementation BIMyPersonViewController

- (void)viewDidLoad{
    
//    UITableView *view = [[UITableView alloc]initWithFrame:self.view.frame];
//    [self.view addSubview:view];
//    
//    view.backgroundColor= [UIColor redColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 80)];
    [self.view addSubview:btn];
    
    [btn setTitle:@"登陆" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(id)sender{
    
}

@end
