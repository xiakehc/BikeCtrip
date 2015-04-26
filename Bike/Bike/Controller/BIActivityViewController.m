//
//  BIActivityViewController.m
//  Bike
//
//  Created by Yuki on 15/4/19.
//  Copyright (c) 2015年 kyu. All rights reserved.
//  

#import "BIActivityViewController.h"

@interface BIActivityViewController ()

@end

@implementation BIActivityViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 80)];
//    [self.view addSubview:btn];
//    
//    [btn setTitle:@"参加活动" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(id)sender{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
