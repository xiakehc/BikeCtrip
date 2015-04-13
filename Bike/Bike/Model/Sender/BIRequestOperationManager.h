//
//  BIRequestOperationManager.h
//  Bike
//
//  Created by Yuki on 4/11/15.
//  Copyright (c) 2015 kyu. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface BIRequestOperationManager : AFHTTPRequestOperationManager

+ (instancetype)sharedClient ;

@end
