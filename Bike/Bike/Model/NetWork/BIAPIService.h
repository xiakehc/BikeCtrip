//
//  BIAPIService.h
//  Bike
//
//  Created by kyu on 15/4/10.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

/*服务请求成功回调*/
typedef void (^serviceSuccessBlock)(id response);


/*服务请求失败回调*/
typedef void (^serviceFailBlock)(NSString* erroeMsg);

@interface BIAPIService : NSObject

/*singal*/
+ (BIAPIService *)shareInstance;

- (void)getRequest:(NSString*)url witParam:(id)params withSuccessBlock:(serviceSuccessBlock)successBlock withFailBlock:(serviceFailBlock)failBlock;



@end
