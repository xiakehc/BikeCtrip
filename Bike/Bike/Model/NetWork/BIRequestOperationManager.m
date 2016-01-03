//
//  BIRequestOperationManager.m
//  Bike
//
//  Created by Yuki on 4/11/15.
//  Copyright (c) 2015 kyu. All rights reserved.
//

#import "BIRequestOperationManager.h"

@implementation BIRequestOperationManager

static NSString * const AFAppAPIBaseURLString = @"http://bikectrip.aliapp.com/";

+ (instancetype)sharedClient {
    static BIRequestOperationManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[BIRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:AFAppAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

+ (NSString*)getClientAppAPIBaseURLString{
    return AFAppAPIBaseURLString;
}

@end

