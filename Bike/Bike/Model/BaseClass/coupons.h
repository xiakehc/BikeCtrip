//
//  coupons.h
//  Bike
//
//  Created by kyu on 15/4/13.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface coupons : NSObject

@property (nonatomic,strong) NSString *cid;
@property (nonatomic,strong) NSString *cname;
@property (nonatomic,strong) NSString *clatitude;
@property (nonatomic,strong) NSString *clongitude;
@property (nonatomic,strong) NSString *cmerchantName;
@property (nonatomic,strong) NSString *camount;
@property (nonatomic,strong) NSString *cpic;
@property (nonatomic,strong) NSString *ctag;
@property (nonatomic,strong) NSString *cnowPirce;
@property (nonatomic,strong) NSString *coldPrice;

@end
