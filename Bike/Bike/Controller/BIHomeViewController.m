//
//  ViewController.m
//  Bike
//
//  Created by kyu on 15/4/9.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIHomeViewController.h"
#import "ImagePlayerView.h"
#import "UIImageView+WebCache.h"
#import "BIModuleVIew.h"
#import "BIListViewController.h"
#import "BIHomeVCManager.h"
#import "BIMoiveViewController.h"

@interface BIHomeViewController ()<ImagePlayerViewDelegate, BIModuleVIewDelegate>
{
    NSArray *_dataList;/*首页板块数据模型*/
}
@property (weak, nonatomic) IBOutlet ImagePlayerView *imagePlayerView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, strong) NSArray *imageURLs;/*广告URL*/

@end

@implementation BIHomeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.viewSize = CGSizeMake(CURRENTSCREEN_WIDTH, CURRENTSCREEN_HEIGHT-60);
    self.contentView.frame = CGRectMake(0, 100, CURRENTSCREEN_WIDTH, CURRENTSCREEN_HEIGHT -100-60);
    self.imagePlayerView.frame = CGRectMake(0, 0, CURRENTSCREEN_WIDTH, 100);

    //Adver
    [self initAdver];
    [self initHomePageContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initAdver{
    self.imageURLs = @[[NSURL URLWithString:@"http://images.rednet.cn/articleimage/2014/05/13/103213658.jpg"],
                       [NSURL URLWithString:@"http://img.taopic.com/uploads/allimg/120520/159368-1205201R44746.jpg"],
                       [NSURL URLWithString:@"http://pic21.nipic.com/20120513/2786001_165117083000_2.jpg"],
                       [NSURL URLWithString:@"http://pic21.nipic.com/20120513/2786001_165116541000_2.jpg"]
                       ];
    
    [self.imagePlayerView initWithCount:self.imageURLs.count delegate:self];
    self.imagePlayerView.scrollInterval = 2.0f;
    self.imagePlayerView.pageControlPosition = ICPageControlPosition_BottomCenter;
    self.imagePlayerView.hidePageControl = NO;
}

- (void)initHomePageContentView{
    [self initDataModel];
    if(!_dataList || _dataList.count == 0){
        return;
    }
    //5px 是间距
    NSInteger H = (self.contentView.viewHeight-5*(_dataList.count+1))/_dataList.count;
    for(int i = 0;i<_dataList.count;i++)
    {
        UIView *view = [self.view viewWithTag:100+i];
        view.frame = CGRectMake(5, (5+H)*i+5, self.view.viewWidth-10, H);
        NSInteger key = (i+1)*1000;
        switch (i) {
            case 0:
            {
                BIModuleVIew *view1 = [[BIModuleVIew alloc]initWithFrame:view.frame withList: [_dataList objectAtIndex:i]
                                                               withColor:CTColorHex(0x1e90ff  ) withKey:key withDelegate:self];
                [view addSubview:view1];
            }
                break;
            case 1:
            {
                BIModuleVIew *view1 = [[BIModuleVIew alloc]initWithFrame:view.frame withList: [_dataList objectAtIndex:i]
                                                               withColor:CTColorHex(0xFF4500) withKey:key withDelegate:self];
                [view addSubview:view1];
            }
                break;
            case 2:
            {
                BIModuleVIew *view1 = [[BIModuleVIew alloc]initWithFrame:view.frame withList: [_dataList objectAtIndex:i]
                                                               withColor:CTColorHex(0x32cd32) withKey:key withDelegate:self];
                [view addSubview:view1];
            }
                break;
            case 3:
            {
                BIModuleVIew *view1 = [[BIModuleVIew alloc]initWithFrame:view.frame withList: [_dataList objectAtIndex:i]
                                                               withColor:CTColorHex(0xFFA500) withKey:key withDelegate:self];
                [view addSubview:view1];
            }
                break;
                
            default:
                break;
        }
    }
}

/**
 *  模块数据配置化
 */
- (void)initDataModel{
    _dataList =@[
                 @[[[BIModuleModel alloc]initWithContent:@"房价"],
                   [NSArray arrayWithObjects:
                    [[BIModuleModel alloc]initWithContent:@"购房"],
                    [[BIModuleModel alloc]initWithContent:@"新房房价"], nil],
                   [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"公寓"],
                    [[BIModuleModel alloc]initWithContent:@"二手房"], nil]],
                 @[
                     [[BIModuleModel alloc]initWithContent:@"电影"],
                     [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"港台剧"],
                      [[BIModuleModel alloc]initWithContent:@"大陆剧"], nil],
                     [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"欧美大片"],
                      [[BIModuleModel alloc]initWithContent:@"Top250电影"], nil],
                     ],
                 @[
                     [[BIModuleModel alloc]initWithContent:@"同城活动"],
                     [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"戏剧"],
                      [[BIModuleModel alloc]initWithContent:@"讲座"], nil],
                     [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"公益"],
                      [[BIModuleModel alloc]initWithContent:@"展览"], nil],
                     ],
                 @[
                     [[BIModuleModel alloc]initWithContent:@"商务合作"],
                     [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"在线旅游"],
                      [[BIModuleModel alloc]initWithContent:@"O2O美食"], nil],
                     [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"P2P金融"],
                      [[BIModuleModel alloc]initWithContent:@"医疗健康"], nil],
                     ]
                 ];
}


#pragma mark - ImagePlayerViewDelegate
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index
{
    [imageView sd_setImageWithURL:[self.imageURLs objectAtIndex:index] placeholderImage:[UIImage imageNamed:@"banner.png"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        //BILog(@"download success : %@",imageURL);
    }];
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index
{
    NSLog(@"did tap index = %d", (int)index);
}

#pragma mark - BIModuleVIewDelegate
- (void)homeBIModuleVIewButtonClick:(NSInteger)index{
    NSInteger row = index/1000-1;
    NSInteger column = index%1000;
    //BILog(@"you select row is :%ld And column is :%ld",row, column);
    
    NSArray *list = [_dataList objectAtIndex:row];
    NSString * title = @"";
    if(column == 0){
        title = ((BIModuleModel*)[list objectAtIndex:0]).content;
    }
    else if (column >= 1 && column <=2){
        BIModuleModel *md = (BIModuleModel*)[[list objectAtIndex:1] objectAtIndex:column-1];
        title = md.content;
    }
    else if (column >= 3 && column <=4){
        BIModuleModel *md = (BIModuleModel*)[[list objectAtIndex:2] objectAtIndex:column-3];
        title = md.content;
    }
    
    if (row==1) {
        BIMoiveViewController*vc  = [[BIMoiveViewController alloc]init];
        vc.title = [NSString stringWithFormat:@"%@Top205",title];
        vc.vcType = VCType_Movie;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(row==2){
        BIMoiveViewController*vc  = [[BIMoiveViewController alloc]init];
        vc.title = [NSString stringWithFormat:@"%@Top100",title];
        vc.vcType = VCType_Activity;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(row == 0){
        BIListViewController *vc = [[BIListViewController alloc]init];
        vc.title = title;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"提示" message:@"商务合作模块，请联系QQ:1062120982" delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        [view show];
    }
}


@end
