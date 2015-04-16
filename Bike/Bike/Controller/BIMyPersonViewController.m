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
    UITableView *view = [[UITableView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:view];
    
    view.backgroundColor= [UIColor redColor];
}

@end
