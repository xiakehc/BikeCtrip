//
//  ViewController.m
//  Bike
//
//  Created by kyu on 15/4/9.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UITableView *mTableView;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CURRENTSCREEN_WIDTH, CURRENTSCREEN_HEIGHT)];
    
    
    
//    NSString *str = @"index.php?s=/wap/ajax/coupons/";
//    
//    [[BIAPIService shareInstance] getRequest:str witParam:nil withSuccessBlock:^(id response) {
//        NSLog(@"%@",response);
//    } withFailBlock:^(NSString *erroeMsg) {
//        NSLog(@"%@", erroeMsg);
//    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
