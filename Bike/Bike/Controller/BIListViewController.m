//
//  BIListViewController.m
//  Bike
//
//  Created by kyu on 15/4/15.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIListViewController.h"
#import "NSJSONParsing.h"
#import "BIListCell.h"
#import "TAOverlay.h"

#define kTestURL    @"index.php?s=/wap/ajax/coupons/"

@interface BIListViewController(){
    NSMutableArray *_dataList;
}
@property (nonatomic,strong) UITableView *mTableView;

@end

@implementation BIListViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad{
    self.mTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CURRENTSCREEN_WIDTH, CURRENTSCREEN_HEIGHT)];
    self.mTableView.dataSource = self;
    self.mTableView.delegate = self;
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.mTableView registerClass:[BIListCell class] forCellReuseIdentifier:@"BIListCellIdentifier"];
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
    [TAOverlay showOverlayWithLabel:@"玩命的加载中..." Options:TAOverlayOptionOverlayTypeActivityLeaf|TAOverlayOptionOverlaySizeFullScreen];
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
    BIListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BIListCellIdentifier"];
    if(!cell){
        cell = (BIListCell*)[[BIListCell alloc]init];
    }
    
    cell.viewHeight = 80;
    cell.viewWidth = tableView.viewWidth;
    [cell updateCell:[_dataList objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    coupons *model = (coupons *)[_dataList objectAtIndex:row];
    
    NSString *str = model.cname;
    UIAlertView *view = [[UIAlertView alloc]initWithTitle:nil message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [view show];
}



@end
