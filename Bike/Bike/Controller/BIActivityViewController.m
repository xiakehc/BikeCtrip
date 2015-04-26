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
    ActivityType_Shopping,
    ActivityType_Game,
}ActivityType;

@interface BIActivityViewController ()<UITableViewDelegate,UITableViewDelegate>
{
    UITableView *_myTableView;
    NSMutableDictionary *dataSorceDict;
}
@end

@implementation BIActivityViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_myTableView registerClass:[BIDisCoveryCell class] forCellReuseIdentifier:@"BIDisCoveryCellIditify"];
    
    dataSorceDict = [NSMutableDictionary dictionary];
    [dataSorceDict setObject:@"朋友圈" forKey: [NSNumber numberWithInt:ActivityType_PengYouQuan]];
    [dataSorceDict setObject:@"扫一扫" forKey: [NSNumber numberWithInt:ActivityType_SaoYiSao]];
    [dataSorceDict setObject:@"摇一摇" forKey: [NSNumber numberWithInt:ActivityType_YaoYiYao]];
    [dataSorceDict setObject:@"购物" forKey: [NSNumber numberWithInt:ActivityType_Shopping]];
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
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BIDisCoveryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BIDisCoveryCellIditify"];
    if(!cell){
        cell = (BIDisCoveryCell*)[[BIDisCoveryCell alloc]init];
    }
    
    cell.viewHeight = 80;
    cell.viewWidth = tableView.viewWidth;
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
                [cell updeteCell:[dataSorceDict objectForKey:[NSNumber numberWithInt:ActivityType_Shopping]]
                         withImg:@"ff_IconBottle@2x.png"];
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
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

}


@end
