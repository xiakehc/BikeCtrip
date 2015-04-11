//
//  CBNetWorkUtil.m
//  Bike
//
//  Created by Yuki on 4/11/15.
//  Copyright (c) 2015 kyu. All rights reserved.
//

#import "BIUtilNetWork.h"

@implementation BIUtilNetWork

+ (BIUtilNetWork *)shareInstance{
    static BIUtilNetWork *util = nil ;
    static dispatch_once_t predicate ;
    dispatch_once(&predicate, ^{
        util = [[self alloc]init];
    });
    
    return util;
}

/* 检测网络连接的单例,网络变化时的回调方法 */
- (void)getCurrentNetWorkStatus{
    
    [[AFNetworkReachabilityManager sharedManager ] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSString *str = @"";
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
            {
                str = @"网络未连接，请检查网络。";
            }
                break;
            case AFNetworkReachabilityStatusUnknown:
            {
                str = @"未知网络信号。";
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                str = @"";//网络信号正常";
            }
                break;
            default:
                break;
        }
        
        [self notifyNetworkChanged:str];
    }];
}

/* postNotificationName */
- (void)notifyNetworkChanged:(NSObject *)obj {
    [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkDidChangedNotification object:obj userInfo:NULL];
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}









@end
