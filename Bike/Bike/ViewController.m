//
//  ViewController.m
//  Bike
//
//  Created by kyu on 15/4/9.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "ViewController.h"
#import "NSJSONParsing.h"
#import "BIHomeCell.h"
#import "TAOverlay.h"

#define kTestURL    @"index.php?s=/wap/ajax/coupons/"

@interface ViewController (){
    NSMutableArray *_dataList;
}

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
    self.mTableView.dataSource = self;
    self.mTableView.delegate = self;
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.mTableView registerClass:[BIHomeCell class] forCellReuseIdentifier:@"BIHomeCellIdentifier"];
    [self.view addSubview:self.mTableView];

    [self startLoading];
    
    [[BIAPIService shareInstance] getRequest:kTestURL witParam:nil withSuccessBlock:^(id response) {
        BILog(@"%@",response);
        NSArray *arrlist = (NSArray*)response;
        _dataList = [NSJSONParsing jsonParsing:arrlist WithType:ENUM_CLASSMODEL_COUPONS];
        
        [self.mTableView reloadData];
        [self hideLoading];
    } withFailBlock:^(NSString *erroeMsg) {
        BILog(@"%@", erroeMsg);
        [self performSelector:@selector(hideLoading) withObject:nil afterDelay:1.5];
        [TAOverlay showOverlayWithLabel:erroeMsg Options:TAOverlayOptionOverlayTypeError];
    }];
}

- (void)hideLoading{
    [TAOverlay hideOverlay];
}

- (void)startLoading{
    [TAOverlay showOverlayWithLabel:@"骑呀骑呀..." Options:TAOverlayOptionOverlayTypeActivityLeaf|TAOverlayOptionOverlaySizeFullScreen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BIHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BIHomeCellIdentifier"];
    if(!cell){
        cell = (BIHomeCell*)[[BIHomeCell alloc]init];
    }
    
    [cell updateCell:[_dataList objectAtIndex:indexPath.row]];
    
    return cell;
}













@end
