//
//  BIHomeVCManager.h
//  Bike
//
//  Created by Yuki on 15/4/18.
//  Copyright (c) 2015年 kyu. All rights reserved.
//  首页－页面管理器

#import <Foundation/Foundation.h>

@interface BIHomeVCManager : NSObject

+ (BIHomeVCManager *)shareInstance;

@property (nonatomic,strong) NSMutableArray *vcList;
@property (nonatomic,strong) NSMutableArray *titleList;

- (void)addVCINProperty:(UIViewController*)rootVC;

@end
