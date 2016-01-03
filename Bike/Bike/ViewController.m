//
//  ViewController.m
//  Bike
//
//  Created by kyu on 15/4/9.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "ViewController.h"
#import "BIHomeVCManager.h"
#import "BIToolBar.h"
#import "BIColorCollection.h"

@interface ViewController ()<BIToolBarDelegate>
{
    UIView *currentView;
    NSInteger currentToolBarIndex;
}
@property (weak, nonatomic) IBOutlet UIView *toolbar;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initToolBar];
    [self addAllVC];
    
    /*设置当前显示VC*/
    currentToolBarIndex = 0;
    UIViewController *vc =  [[BIHomeVCManager shareInstance].vcList objectAtIndex:currentToolBarIndex];
    currentView = vc.view;
    currentView.frame =CGRectMake(0, 0, CURRENTSCREEN_WIDTH, CURRENTSCREEN_HEIGHT-60);
    [self.view addSubview:currentView];
    
    [self.view bringSubviewToFront:self.toolbar];
}

/**
 *  添加所有子ViewController
 */
- (void)addAllVC{
    BIHomeVCManager *_mange = [BIHomeVCManager shareInstance];
    for(int i =0;i<_mange.vcList.count ; i++){
        UIViewController *vc = [[BIHomeVCManager shareInstance].vcList objectAtIndex:i];
        [self addChildViewController:vc];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initToolBar{
    self.toolbar.viewWidth = self.view.viewWidth;
    BIToolBar *toolbar = [[BIToolBar alloc]initWithFrame:self.toolbar.frame withDelegate:self];
    [self.toolbar addSubview:toolbar];
}

#pragma mark - BIToolBarDelegate
- (void)homeBIToolBarDelegateButtonClick:(NSInteger)index{
    if(index == currentToolBarIndex)
    {
        return ;
    }
    currentToolBarIndex = index;    //设置index
    
    BIHomeVCManager *_manager = [BIHomeVCManager shareInstance];
    UIViewController *detationVC = [_manager.vcList objectAtIndex:index];
    self.title  = [_manager.titleList objectAtIndex:index];
    //set NavigationBar 背景颜色&title 颜色
    [self.navigationController.navigationBar setBarTintColor:kBIMediumSeaGreen];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    [currentView removeFromSuperview];
    currentView = detationVC.view;
    currentView.frame = CGRectMake(0, 0, CURRENTSCREEN_WIDTH, CURRENTSCREEN_HEIGHT-60);
    [self.view addSubview:currentView];
    [self.view bringSubviewToFront:self.toolbar];
}

@end
