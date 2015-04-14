//  底层统一API接口
//  BIAPIService.h
//  Bike
//
//  Created by kyu on 15/4/10.
//  Copyright (c) 2015年 kyu. All rights reserved.
//  API

#import <Foundation/Foundation.h>

/*service success callback*/
typedef void (^serviceSuccessBlock)(id response);


/*service fail callback*/
typedef void (^serviceFailBlock)(NSString* erroeMsg);

@interface BIAPIService : NSObject

/*singal model*/
+ (BIAPIService *)shareInstance;

+ (NSString*)getClientAppAPIBaseURLString;

/**
 *  GET - JSON
 *
 *  @param url
 *  @param params
 *  @param successBlock
 *  @param failBlock
 */
- (void)getRequest:(NSString*)url witParam:(id)params withSuccessBlock:(serviceSuccessBlock)successBlock withFailBlock:(serviceFailBlock)failBlock;

/**
 *  POST - JSON
 *
 *  @param url
 *  @param params
 *  @param successBlock
 *  @param failBlock
 */
- (void)postRequest:(NSString*)url witParam:(id)params withSuccessBlock:(serviceSuccessBlock)successBlock withFailBlock:(serviceFailBlock)failBlock;



@end
