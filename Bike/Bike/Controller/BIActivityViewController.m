//
//  BIActivityViewController.m
//  Bike
//
//  Created by Yuki on 15/4/19.
//  Copyright (c) 2015年 kyu. All rights reserved.
//  

#import "BIActivityViewController.h"
#import "BIDisCoveryCell.h"

typedef enum {
    ActivityType_PengYouQuan = 0,
    ActivityType_SaoYiSao,
    ActivityType_YaoYiYao,
    ActivityType_Collection,
    ActivityType_Bottle,
    ActivityType_Friend,
    ActivityType_Game,
}ActivityType;

@interface BIActivityViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableDictionary *dataSorceDict;
    UITableView *_myTableView;
}
@end

@implementation BIActivityViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CURRENTSCREEN_WIDTH, self.view.viewHeight-128)];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_myTableView registerClass:[BIDisCoveryCell class] forCellReuseIdentifier:@"BIDisCoveryCellIditify"];
    
    self.view.backgroundColor = _myTableView.backgroundColor = CTColorHexA(0xd3d3d3,0.1);//[UIColor whiteColor];//kBISnow;
    
    dataSorceDict = [NSMutableDictionary dictionary];
    [dataSorceDict setObject:@"朋友圈" forKey: [NSNumber numberWithInt:ActivityType_PengYouQuan]];
    [dataSorceDict setObject:@"扫一扫" forKey: [NSNumber numberWithInt:ActivityType_SaoYiSao]];
    [dataSorceDict setObject:@"摇一摇" forKey: [NSNumber numberWithInt:ActivityType_YaoYiYao]];
    [dataSorceDict setObject:@"漂流瓶" forKey: [NSNumber numberWithInt:ActivityType_Bottle]];
    [dataSorceDict setObject:@"附近的伙伴" forKey: [NSNumber numberWithInt:ActivityType_Friend]];
    [dataSorceDict setObject:@"收藏" forKey: [NSNumber numberWithInt:ActivityType_Collection]];
    [dataSorceDict setObject:@"游戏" forKey: [NSNumber numberWithInt:ActivityType_Game]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 1+1;
    }else{
        return 2+1;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0 && indexPath.section == 0){
        return 15;
    }
    else if (indexPath.row == 0&& indexPath.section != 0){
        return 28;
    }
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BIDisCoveryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BIDisCoveryCellIditify"];
    if(!cell){
        cell = (BIDisCoveryCell*)[[BIDisCoveryCell alloc]init];
    }
    cell.viewHeight = 50;
    cell.viewWidth = tableView.viewWidth;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.section) {
        case 0:
        {
            if(indexPath.row == 0){
                return [self returnDefineCell];
            }
            else if (indexPath.row == 1){
                [cell updeteCell:[dataSorceDict objectForKey:[NSNumber numberWithInt:ActivityType_PengYouQuan]] withImg:@"ff_IconShowAlbum@2x.png"];
            }
            return cell;
        }
            break;
        case 1:
        {
            if(indexPath.row == 0){
                return [self returnDefineCell];
            }
            if(indexPath.row == 1){
             [cell updeteCell:[dataSorceDict objectForKey:[NSNumber numberWithInt:ActivityType_SaoYiSao]]
                      withImg:@"ff_IconQRCode@2x.png"];
                cell.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
            }else if (indexPath.row ==2){
                 [cell updeteCell:[dataSorceDict objectForKey:[NSNumber numberWithInt:ActivityType_YaoYiYao]]
                      withImg:@"ff_IconShake@2x.png"];
            }
            return cell;
        }
            break;
        case 2:
        {
            if(indexPath.row == 0){
                return [self returnDefineCell];
            }
           else if(indexPath.row == 1){
                [cell updeteCell:[dataSorceDict objectForKey:[NSNumber numberWithInt:ActivityType_Bottle]]
                         withImg:@"ff_IconBottle@2x.png"];
               cell.separatorInset = UIEdgeInsetsMake(cell.viewHeight-0.5, 15, 0, 0);
            }else if (indexPath.row ==2){
                [cell updeteCell:[dataSorceDict objectForKey:[NSNumber numberWithInt:ActivityType_Friend]]
                         withImg:@"ff_IconLocationService@2x"];//@"MoreGame@2x.png"];
            }
            return cell;
        }
            break;
            
        case 3:
        {
            if(indexPath.row == 0){
                return [self returnDefineCell];
            }
            else if(indexPath.row == 1){
                [cell updeteCell:[dataSorceDict objectForKey:[NSNumber numberWithInt:ActivityType_Collection]]
                         withImg:@"Action_MyFavAdd@3x.png"];
                cell.separatorInset = UIEdgeInsetsMake(cell.viewHeight-0.5, 15, 0, 0);
            }else if (indexPath.row ==2){
                [cell updeteCell:[dataSorceDict objectForKey:[NSNumber numberWithInt:ActivityType_Game]]
                         withImg:@"MoreGame@2x.png"];
            }
            return cell;
        }
            break;
            
        default:
            break;
    }
    
    
    return cell;
}

- (UITableViewCell*)returnDefineCell{
    BIBaseTableViewCell *cell = [[BIBaseTableViewCell alloc]init];
    cell.separateMode = UISeparatableViewSeparateModeBottom;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setSeparatorLineWidth:0.5];
    [cell setSeparatorColor:kBIGainsBoro];
    cell.separatorViewWidth = CURRENTSCREEN_WIDTH;
    cell.backgroundColor = CTColorHexA(0xd3d3d3,0.1);// [UIColor whiteColor];//kBISnow;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"个人信息 " message:@"点击Click" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [view show];
}


@end
