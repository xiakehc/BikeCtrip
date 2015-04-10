//
//  ViewController.m
//  Bike
//
//  Created by kyu on 15/4/9.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = @"http://www.ruo-bl.com/index.php?s=/wap/ajax/coupons/";
    
    [[BIAPIService shareInstance] getRequest:str witParam:nil withSuccessBlock:^(id response) {
        NSLog(@"%@",response);
    } withFailBlock:^(NSString *erroeMsg) {
        NSLog(@"%@", erroeMsg);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
