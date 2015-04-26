//
//  BIHomeVCManager.m
//  Bike
//
//  Created by Yuki on 15/4/18.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIHomeVCManager.h"
#import "BIMyPersonViewController.h"
#import "BIActivityViewController.h"
#import "BIHomeViewController.h"

@interface BIHomeVCManager(){
    BIHomeViewController *homeVC;
    BIMyPersonViewController *personVC;
    BIActivityViewController *activityVC;
}

@end

@implementation BIHomeVCManager
@synthesize vcList, titleList;

+ (BIHomeVCManager *)shareInstance{
    static BIHomeVCManager *sharedBIAPIService = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedBIAPIService = [[self alloc]init];
    });
    
    return sharedBIAPIService;
}

- (void)addVCINProperty:(UIViewController*)rootVC{
    if(!self.vcList){
        self.vcList = [NSMutableArray array];
    }
    else{
        [self.vcList removeAllObjects];
    }
    
    homeVC = [[BIHomeViewController alloc]init];
    [self.vcList addObject:homeVC];
    activityVC = [[BIActivityViewController alloc]init];
    activityVC.title = @"self.navigationController.navigationBarHidden = NO;";
    [self.vcList addObject:activityVC];
    personVC = [[BIMyPersonViewController alloc]init];
    [self.vcList addObject:personVC];

    
    if(!self.titleList){
        self.titleList = [NSMutableArray array];
    }else{
        [self.titleList removeAllObjects];
    }
    
    [self.titleList addObject:@"首页"];
    [self.titleList addObject:@"发现"];
    [self.titleList addObject:@"个人"];
}

@end
