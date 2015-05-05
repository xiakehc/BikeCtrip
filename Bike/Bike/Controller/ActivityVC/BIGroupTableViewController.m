//
//  BIGroupTableView.m
//  Bike
//
//  Created by Yuki on 15/5/4.
//  Copyright (c) 2015年 kyu. All rights reserved.
//  朋友圈

#import "BIGroupTableViewController.h"
#import "BIGroupCell.h"


@interface BIGroupTableViewController(){
    NSMutableArray *_dataList;
}

@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation BIGroupTableViewController

- (instancetype)init{
    if(self == [super init]){
        self.view.viewWidth = CURRENTSCREEN_WIDTH;
        self.view.viewHeight = CURRENTSCREEN_HEIGHT;
        self.myTableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _dataList = [NSMutableArray array];
    }
    
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"BIGroupCell" bundle:nil] forCellReuseIdentifier:@"BIGroupCellIdentifier"];
    
    [self sendService];
}

- (void)sendService{
    
}

#pragma mark -- UITableViewDelegate、DataSource --
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(_dataList){
        return _dataList.count;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BIGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BIGroupCellIdentifier"];
    if(!cell){
        cell = (BIGroupCell*)[[BIGroupCell alloc]init];
    }
    
    cell.viewHeight = 80;
    cell.viewWidth = tableView.viewWidth;
    [cell updateCell:[_dataList objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}


@end
