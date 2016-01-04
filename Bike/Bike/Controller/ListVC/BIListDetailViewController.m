//
//  BIListDetailViewController.m
//  Bike
//
//  Created by Yuki on 16/1/4.
//  Copyright © 2016年 kyu. All rights reserved.
//

#import "BIListDetailViewController.h"
#import "BIAPIService.h"
#import "TAOverlay.h"
#import "BIDetailListCell.h"
#import "CityFJView.h"

@interface BIListDetailViewController (){
    NSMutableArray *_dataList;
    CityFJView *fj;
}
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation BIListDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    fj = [[CityFJView alloc]init];
    [fj setLabelFrame:CGRectMake(0, 64, self.view.frame.size.width, 100)];
    fj.hidden =YES;
    [self.view addSubview:fj];
    self.tableView = [UITableView new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.frame = CGRectMake(0, fj.viewYBelow, self.view.viewWidth, self.view.viewHeight-120);
    [self.tableView registerClass:[BIDetailListCell class] forCellReuseIdentifier:@"BIDetailListCell_identifier"];
    [self.view addSubview:self.tableView];
    
    _dataList = [NSMutableArray array];
    [self startLoading];
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@", LISTDETAILURL, self.year, self.month];
    [[BIAPIService shareInstance] getRequest:url witParam:nil withSuccessBlock:^(id response) {
        BILog(@"%@",response);
        NSData* data = response;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _dataList = [dict objectForKey:@"list"];
        
         fj.hidden =NO;
        [self.tableView reloadData];
        [self hideLoading];
    } withFailBlock:^(NSString *erroeMsg) {
        BILog(@"%@", erroeMsg);
         fj.hidden =YES;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.tableView = nil;
    _dataList = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BIDetailListCell *cell = (BIDetailListCell*)[tableView dequeueReusableCellWithIdentifier:@"BIDetailListCell_identifier" forIndexPath:indexPath];
    id model = [_dataList objectAtIndex:indexPath.row];
    [cell updateCell:model];
    
    return cell;
}



@end
