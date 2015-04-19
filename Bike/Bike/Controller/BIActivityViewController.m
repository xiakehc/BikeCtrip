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

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 80)];
    [self.view addSubview:btn];
    
    [btn setTitle:@"参加活动" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(id)sender{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
