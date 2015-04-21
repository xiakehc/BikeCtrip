//
//  AppDelegate.m
//  Bike
//
//  Created by kyu on 15/4/9.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "AppDelegate.h"
#import "BIUtilNetWork.h"
#import "BIUtilString.h"
 #import <CoreLocation/CoreLocation.h>
#import "BIHomeVCManager.h"
//share
#import "WXApi.h"
#import "WeiboSDK.h"
#import <ShareSDK/ShareSDK.h>

#define ShareKeyDefine    @"6dfa8227bfca"

@interface AppDelegate ()<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    BIHomeVCManager *_manager;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //添加网络变化监听
    [self registNotification];
    
    //开始监听网络
    [self startDetectInternet];
    
    // 初始化定位
    [self startLocationService];

    //开启VC管理类
    _manager = [BIHomeVCManager shareInstance];
    [_manager addVCINProperty:self.window.rootViewController];
    
    //初始化ShareSDK
    [ShareSDK registerApp:ShareKeyDefine];
    [self initializePlat];
    [self initializePlatForTrusteeship];
    

    
    return YES;
}


- (void)initializePlat{
    /**
     连接新浪微博开放平台应用以使用相关功能，此应用需要引用SinaWeiboConnection.framework
     http://open.weibo.com上注册新浪微博开放平台应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectSinaWeiboWithAppKey:@"2624857760"
                               appSecret:@"bbfe4ae005b7134d5ef448b384f1e07f"
                             redirectUri:@"https://api.weibo.com/oauth2/default.html"];
    /**
     连接微信应用以使用相关功能，此应用需要引用WeChatConnection.framework和微信官方SDK
     http://open.weixin.qq.com上注册应用，并将相关信息填写以下字段
     **/
    [ShareSDK connectWeChatWithAppId:@"wxac383bbc8a40bfa7"
                           appSecret:@"36422141f5321a61573e756cab2bab36"
                           wechatCls:[WXApi class]];
    
    //连接短信分享
    [ShareSDK connectSMS];
    
    //连接邮件
    [ShareSDK connectMail];
    
    //连接打印
   // [ShareSDK connectAirPrint];
    
    //连接拷贝
    [ShareSDK connectCopy];
}

- (void)initializePlatForTrusteeship
{
    //导入微信需要的外部库类型，如果不需要微信分享可以不调用此方法
    [ShareSDK importWeChatClass:[WXApi class]];
    
}

- (void)startDetectInternet{
    [[BIUtilNetWork shareInstance]  getCurrentNetWorkStatus];
}

- (void)registNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkChanged:)
                                                 name:kNetworkDidChangedNotification object:nil];
}

- (void)networkChanged:(NSNotification*)notification
{
    NSString* str = (NSString*)[notification object];
    if(![BIUtilString emptyOrNull:str])
    {
        UIAlertView *view = [[UIAlertView alloc]initWithTitle:nil message:str delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [view show];
    }
}

- (void)startLocationService{
    if (locationManager==nil)
    {
        locationManager =[[CLLocationManager alloc] init];
    }
    
    if ([CLLocationManager locationServicesEnabled])
    {
        locationManager.delegate=self;
        locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        locationManager.distanceFilter=10.0f;
        if([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
            [locationManager requestAlwaysAuthorization]; // 永久授权
        }
        [locationManager startUpdatingLocation];
    }
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:self];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
