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

@interface BIHomeVCManager(){
    BIMyPersonViewController *personVC;
    BIActivityViewController *activityVC;
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

- (void)addVCINProperty:(UIViewController*)rootVC{
    if(!self.vList){
        self.vList = [NSMutableArray array];
    }
    else{
        [self.vList removeAllObjects];
    }
    
    [self.vList addObject:rootVC];
    activityVC = [[BIActivityViewController alloc]init];
    [self.vList addObject:activityVC];
    personVC = [[BIMyPersonViewController alloc]init];
    [self.vList addObject:personVC];
    
//    [rootVC addChildViewController:activityVC];
//    [rootVC addChildViewController:personVC];

}

@end
