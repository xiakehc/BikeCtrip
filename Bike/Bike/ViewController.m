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

@interface ViewController ()<ImagePlayerViewDelegate>
@property (weak, nonatomic) IBOutlet ImagePlayerView *imagePlayerView;
@property (nonatomic, strong) NSArray *imageURLs;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
