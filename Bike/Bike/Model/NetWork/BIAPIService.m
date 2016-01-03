//
//  BIAPIService.m
//  Bike
//
//  Created by kyu on 15/4/10.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIAPIService.h"
#import "BIRequestOperationManager.h"

@interface BIAPIService(){
}
@end

@implementation BIAPIService

+ (BIAPIService *)shareInstance{
    static BIAPIService *sharedBIAPIService = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedBIAPIService = [[self alloc]init];
    });
    
    return sharedBIAPIService;
}

+ (NSString*)getClientAppAPIBaseURLString{
    return [BIRequestOperationManager getClientAppAPIBaseURLString];
}

/**
 *  GET Request
 *
 *  @param url
 *  @param params
 *  @param successBlock
 *  @param failBlock
 */
- (void)getRequest:(NSString*)url witParam:(id)params withSuccessBlock:(serviceSuccessBlock)successBlock withFailBlock:(serviceFailBlock)failBlock
{
    BIRequestOperationManager *manager = [BIRequestOperationManager sharedClient];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer.timeoutInterval = 15.0;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failBlock(@"服务请求失败！");
    }];
}

- (void)postRequest:(NSString*)url witParam:(id)params withSuccessBlock:(serviceSuccessBlock)successBlock withFailBlock:(serviceFailBlock)failBlock
{
    BIRequestOperationManager *manager = [BIRequestOperationManager sharedClient];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failBlock(@"服务请求失败！");
    }];
}








@end
