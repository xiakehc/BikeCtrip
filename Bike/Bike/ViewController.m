//
//  ViewController.m
//  Bike
//
//  Created by kyu on 15/4/9.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "ViewController.h"
#import "ImagePlayerView.h"
#import "UIImageView+WebCache.h"
#import "BIModuleVIew.h"
//#import "BIDefine.h"
#import "BIToolBar.h"

@interface ViewController ()<ImagePlayerViewDelegate>
@property (weak, nonatomic) IBOutlet ImagePlayerView *imagePlayerView;
@property (nonatomic, strong) NSArray *imageURLs;
@property (weak, nonatomic) IBOutlet UIView *toolbar;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //Adver
    [self initAdver];
    [self initHomePageContentView];
    [self initToolBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initAdver{
    self.imageURLs = @[[NSURL URLWithString:@"http://www.ghzw.cn/wzsq/UploadFiles_9194/201109/20110915154150869.bmp"],
                       [NSURL URLWithString:@"http://sudasuta.com/wp-content/uploads/2013/10/10143181686_375e063f2c_z.jpg"],
                       [NSURL URLWithString:@"http://www.yancheng.gov.cn/ztzl/zgycddhsdgy/xwdt/201109/W020110902584601289616.jpg"],
                       [NSURL URLWithString:@"http://a.hiphotos.baidu.com/image/w%3D2048/sign=f0457b80be3eb13544c7b0bb9226a9d3/a5c27d1ed21b0ef46b9acf36dfc451da81cb3e63.jpg"]
                       ];
    
    [self.imagePlayerView initWithCount:self.imageURLs.count delegate:self];
    self.imagePlayerView.scrollInterval = 2.0f;
    self.imagePlayerView.pageControlPosition = ICPageControlPosition_BottomCenter;
    self.imagePlayerView.hidePageControl = NO;
}

- (void)initHomePageContentView{
    NSInteger H = ((CURRENTSCREEN_HEIGHT - 160)-25)/4;
    for(int i = 0;i<4;i++)
    {
        UIView *view = [self.view viewWithTag:100+i];
        view.viewWidth = self.view.viewWidth -10;
        view.frame = CGRectMake(0, (5+H)*i, self.view.viewWidth-10, H);
        //CTShowViewBounds(view, [UIColor redColor]);
        
        switch (i) {
            case 0:
            {
                BIModuleVIew *view1 = [[BIModuleVIew alloc]initWithFrame:view.frame withList:@[
                                                                                               [[BIModuleModel alloc]initWithContent:@"酒店"],
                                                                                               [NSArray arrayWithObjects:
                                                                                                [[BIModuleModel alloc]initWithContent:@"团购"],
                                                                                                [[BIModuleModel alloc]initWithContent:@"今日特惠"], nil],
                                                                                               [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"公寓"],
                                                                                                [[BIModuleModel alloc]initWithContent:@"钟点房"], nil]
                                                                                               ]
                                       withColor:CTColorHex(0xFF4500)];
                [view addSubview:view1];
            }
                break;
            case 1:
            {
                BIModuleVIew *view1 = [[BIModuleVIew alloc]initWithFrame:view.frame withList:@[
                                                                                               [[BIModuleModel alloc]initWithContent:@"机票"],
                                                                                               [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"火车票"],
                                                                                                [[BIModuleModel alloc]initWithContent:@"车车"], nil],
                                                                                               [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"特价机票"],
                                                                                                [[BIModuleModel alloc]initWithContent:@"接送用车"], nil],
                                                                                               ]
                                                    withColor:CTColorHex(0x00BFFF)];
                [view addSubview:view1];
            }
                break;
            case 2:
            {
                BIModuleVIew *view1 = [[BIModuleVIew alloc]initWithFrame:view.frame withList:@[
                                                                                               [[BIModuleModel alloc]initWithContent:@"度假旅游"],
                                                                                               [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"门票"],
                                                                                                [[BIModuleModel alloc]initWithContent:@"签证"], nil],
                                                                                               [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"攻略"],
                                                                                                [[BIModuleModel alloc]initWithContent:@"骑行书"], nil],
                                                                                               ]
                                                               withColor:CTColorHex(0x2E8B57)];
                [view addSubview:view1];
            }
                break;
            case 3:
            {
                BIModuleVIew *view1 = [[BIModuleVIew alloc]initWithFrame:view.frame withList:@[
                                                                                               [[BIModuleModel alloc]initWithContent:@"当地玩乐"],
                                                                                               [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"电影票"],
                                                                                                [[BIModuleModel alloc]initWithContent:@"周末游"], nil],
                                                                                               [NSArray arrayWithObjects:[[BIModuleModel alloc]initWithContent:@"导游"],
                                                                                                [[BIModuleModel alloc]initWithContent:@"本地游"], nil],
                                                                                               ]
                                       withColor:CTColorHex(0xFFA500)];
                [view addSubview:view1];
            }
                break;
                
            default:
                break;
        }
    }

}

- (void)initToolBar{
    self.toolbar.viewWidth = self.view.viewWidth;
    BIToolBar *toolbar = [[BIToolBar alloc]initWithFrame:self.toolbar.frame];
    [self.toolbar addSubview:toolbar];
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

@end
