//
//  CBNetWorkUtil.h
//  Bike
//
//  Created by Yuki on 4/11/15.
//  Copyright (c) 2015 kyu. All rights reserved.
//

#import <Foundation/Foundation.h>

//网络状态变更的时候通知
#define  kNetworkDidChangedNotification @"kNetworkDidChangedNotification"

@interface BIUtilNetWork : NSObject

/*singal model*/
+ (BIUtilNetWork *)shareInstance;

- (void)getCurrentNetWorkStatus;

@end
