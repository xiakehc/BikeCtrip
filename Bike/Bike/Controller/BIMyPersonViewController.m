//
//  BIMyPersonViewController.m
//  Bike
//
//  Created by kyu on 15/4/16.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIMyPersonViewController.h"
#import <ShareSDK/ShareSDK.h>
#import "BITwitterScroll.h"

@interface BIMyPersonViewController ()<UITableViewDataSource,UITableViewDelegate,MBTwitterScrollDelegate>

@end

@implementation BIMyPersonViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad{
    
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 80)];
//    [self.view addSubview:btn];
//    
//    [btn setTitle:@"登陆" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    BITwitterScroll *myTableView = [[BITwitterScroll alloc]
                                    initTableViewWithBackgound:[UIImage imageNamed:@"background.png"]
                                    avatarImage:[UIImage imageNamed:@"icon_collect"]
                                    titleString:@"余康"
                                    subtitleString:@"初级骑行者"
                                    buttonTitle:@"关注"];  
    
    myTableView.tableView.delegate = self;
    myTableView.tableView.dataSource = self;
    myTableView.delegate = self;
    [self.view addSubview:myTableView];
}

- (void)recievedMBTwitterScrollEvent{
    BILog(@"To Do Nothing!");
}

- (void)btnClick:(id)sender{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"background" ofType:@"png"];
    
    //1、构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"要分享的内容"
                                       defaultContent:@"默认内容"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ShareSDK"
                                                  url:@"https://api.weibo.com/oauth2/default.html"
                                          description:@"这是一条演示信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    //1+创建弹出菜单容器（iPad必要）
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //2、弹出分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                //可以根据回调提示用户。
                                if (state == SSResponseStateSuccess)
                                {
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                    message:nil
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"OK"
                                                                          otherButtonTitles:nil, nil];
                                    [alert show];
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                                    message:[NSString stringWithFormat:@"失败描述：%@",[error errorDescription]]
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"OK"
                                                                          otherButtonTitles:nil, nil];
                                    [alert show];
                                }
                            }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text =  @"Cell";
    
    return cell;
}

@end
