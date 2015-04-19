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

@interface BIHomeViewController ()<ImagePlayerViewDelegate, BIModuleVIewDelegate>
{
    NSArray *_dataList;/*首页板块数据模型*/
}
@property (weak, nonatomic) IBOutlet ImagePlayerView *imagePlayerView;
@property (nonatomic, strong) NSArray *imageURLs;/*广告URL*/
@property (weak, nonatomic) IBOutlet UIView *contentView;

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
                                                               withColor:CTColorHex(0xFF4500) withKey:key withDelegate:self];
                [view addSubview:view1];
            }
                break;
            case 1:
            {
                BIModuleVIew *view1 = [[BIModuleVIew alloc]initWithFrame:view.frame withList: [_dataList objectAtIndex:i]
                                                               withColor:CTColorHex(0x00BFFF) withKey:key withDelegate:self];
                [view addSubview:view1];
            }
                break;
            case 2:
            {
                BIModuleVIew *view1 = [[BIModuleVIew alloc]initWithFrame:view.frame withList: [_dataList objectAtIndex:i]
                                                               withColor:CTColorHex(0x2E8B57) withKey:key withDelegate:self];
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
                 @[[[BIModuleModel alloc]initWithContent:@"酒店"],
                   [NSArray arrayWithObjects:
                    [[BIModuleModel alloc]initWithContent:@"团购"],
                    [[BIModuleModel alloc]initWithContent:@"今日特惠"], nil],
                   [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"公寓"],
                    [[BIModuleModel alloc]initWithContent:@"钟点房"], nil]],
                 @[
                     [[BIModuleModel alloc]initWithContent:@"机票"],
                     [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"火车票"],
                      [[BIModuleModel alloc]initWithContent:@"车车"], nil],
                     [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"特价机票"],
                      [[BIModuleModel alloc]initWithContent:@"接送用车"], nil],
                     ],
                 @[
                     [[BIModuleModel alloc]initWithContent:@"度假旅游"],
                     [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"门票"],
                      [[BIModuleModel alloc]initWithContent:@"签证"], nil],
                     [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"攻略"],
                      [[BIModuleModel alloc]initWithContent:@"骑行书"], nil],
                     ],
                 @[
                     [[BIModuleModel alloc]initWithContent:@"当地玩乐"],
                     [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"电影票"],
                      [[BIModuleModel alloc]initWithContent:@"周末游"], nil],
                     [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"导游"],
                      [[BIModuleModel alloc]initWithContent:@"本地游"], nil],
                     ]
                 ];
}


#pragma mark - ImagePlayerViewDelegate
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index
{
    [imageView sd_setImageWithURL:[self.imageURLs objectAtIndex:index] placeholderImage:[UIImage imageNamed:@"banner.png"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        BILog(@"download success : %@",imageURL);
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
    BILog(@"you select row is :%ld And column is :%ld",row, column);
    
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
    
    BIListViewController *vc = [[BIListViewController alloc]init];
    vc.title = title;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
