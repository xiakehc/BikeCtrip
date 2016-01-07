//
//  BIMoiveViewController.m
//  Bike
//
//  Created by Yuki on 16/1/6.
//  Copyright © 2016年 kyu. All rights reserved.
//

#import "BIMoiveViewController.h"
#import "NSJSONParsing.h"
#import "TAOverlay.h"
#import "BIListDetailViewController.h"
#import "BIMovieDetailViewController.h"


@interface BIMoiveViewController(){
    NSMutableArray *_dataList;
}
@property (nonatomic,strong) UITableView *mTableView;
@property (nonatomic,assign) NSInteger page;
@end

@implementation BIMoiveViewController


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
    self.page = 1;//第一次加载第一页，mysql有做分页处理
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:@(self.page),@"page", nil];
    NSString *url = MovieURL;
    if(self.vcType == VCType_Movie){
        url = MovieURL;
    }else if (self.vcType == VCType_Activity){
        url = ActivityURL;
    }
    
    [[BIAPIService shareInstance] getRequest:url witParam:param withSuccessBlock:^(id response) {
        BILog(@"%@",response);
        NSData*data = response;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _dataList = [dict objectForKey:@"list"];
        
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
    cell.vcType = self.vcType;
    cell.viewHeight = 80;
    cell.viewWidth = tableView.viewWidth;
    [cell updateCell:[_dataList objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSDictionary* dict = [_dataList objectAtIndex:row];
    
    NSString *url = [dict objectForKey:@"detailUrl"];
    if(self.vcType == VCType_Movie){
        url = [dict objectForKey:@"detailUrl"];
    }else if (self.vcType == VCType_Activity){
        url = [dict objectForKey:@"activityUrl"];
    }
    NSString *name = [dict objectForKey:@"name"];
    BIMovieDetailViewController *detailVc = [BIMovieDetailViewController new];
    detailVc.url = url;
    detailVc.title = name;
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = barButtonItem;
    [self.navigationController pushViewController: detailVc animated:YES];
}

@end
