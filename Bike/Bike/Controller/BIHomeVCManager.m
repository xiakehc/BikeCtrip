//
//  BIHomeVCManager.m
//  Bike
//
//  Created by Yuki on 15/4/18.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIHomeVCManager.h"
#import "BIMyPersonViewController.h"

@interface BIHomeVCManager(){
    BIMyPersonViewController *personVC;
}

@end

@implementation BIHomeVCManager
@synthesize vList;

+ (BIHomeVCManager *)shareInstance{
    static BIHomeVCManager *sharedBIAPIService = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedBIAPIService = [[self alloc]init];
    });
    
    return sharedBIAPIService;
}

- (void)addViewINProperty{
    if(!self.vList){
        self.vList = [NSMutableArray array];
    }
    else{
        [self.vList removeAllObjects];
    }
    
    personVC = [[BIMyPersonViewController alloc]init];
    [self.vList addObject:personVC.view];
}

@end
