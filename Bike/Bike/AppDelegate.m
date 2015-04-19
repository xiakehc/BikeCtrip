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
    
    return YES;
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
