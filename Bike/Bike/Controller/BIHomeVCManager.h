//
//  BIHomeVCManager.h
//  Bike
//
//  Created by Yuki on 15/4/18.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIHomeVCManager : NSObject

+ (BIHomeVCManager *)shareInstance;

@property (nonatomic,strong) NSMutableArray *vList;

- (void)addViewINProperty;

@end
