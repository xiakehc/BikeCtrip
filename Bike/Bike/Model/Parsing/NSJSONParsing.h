//
//  NSJSONParsing.h
//  Bike
//
//  Created by kyu on 15/4/13.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONKit.h"

typedef enum{
    ENUM_CLASSMODEL_COUPONS,//coupons类
    
}ENUM_CLASSMODEL;



@interface NSJSONParsing : NSObject

+ (id)jsonParsing:(NSArray*)list WithType:(ENUM_CLASSMODEL)type;

@end
