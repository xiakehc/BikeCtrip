//
//  BIMovieDetailViewController.m
//  Bike
//
//  Created by Yuki on 16/1/6.
//  Copyright © 2016年 kyu. All rights reserved.
//

#import "BIMovieDetailViewController.h"

@implementation BIMovieDetailViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"share.png"] style:UIBarButtonItemStyleDone target:self action:@selector(share)];
    self.navigationItem.rightBarButtonItem =item;
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.frame];
    web.delegate  = self;
    NSURLRequest* request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.url]];
    [web loadRequest:request];
    [self.view addSubview:web];
}

- (void)share{
    UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"提示" message:@"分享功能还未开通，请联系管理员QQ:1062120982" delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
    [view show];
}

- (void)hideLoading{
    [TAOverlay hideOverlay];
}

- (void)startLoading{
    [TAOverlay showOverlayWithLabel:@"加载中..." Options:TAOverlayOptionOverlayTypeActivityBlur|TAOverlayOptionOverlaySizeFullScreen];
}


- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self startLoading];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideLoading];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideLoading];
}

@end
