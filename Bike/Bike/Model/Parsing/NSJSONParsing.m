//
//  NSJSONParsing.m
//  Bike
//
//  Created by kyu on 15/4/13.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "NSJSONParsing.h"
#import "coupons.h"

@implementation NSJSONParsing

+ (id)jsonParsing:(NSArray*)list WithType:(ENUM_CLASSMODEL)type{
    NSMutableArray *jsonList = [NSMutableArray array];
    switch (type) {
        case ENUM_CLASSMODEL_COUPONS:
        {
            for (int i = 0; i<list.count; i++) {
                NSDictionary *item=[list objectAtIndex:i];
                coupons *cm = [[coupons alloc]init];
                cm.cid = [item objectForKey:@"_id"];
                cm.camount = [item objectForKey:@"amount"];
                cm.clatitude = [item objectForKey:@"latitude"];
                cm.clongitude = [item objectForKey:@"longitude"];
                cm.cmerchantName = [item objectForKey:@"merchantName"];
                cm.cname= [item objectForKey:@"name"];
                cm.cnowPirce = [item objectForKey:@"nowPrice"];
                cm.coldPrice = [item objectForKey:@"oldPrice"];
                cm.cpic = [item objectForKey:@"pic"];
                cm.ctag = [item objectForKey:@"tag"];
                
                [jsonList addObject:cm];
            }
            
            return jsonList;
        }
            break;
            
            
            
            
            
            
            
            
            
            
        default:
            break;
    }
    
    return nil;
}

@end
