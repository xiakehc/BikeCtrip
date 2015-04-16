//
//  BIModuleModel.h
//  Bike
//
//  Created by kyu on 15/4/16.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIModuleModel : NSObject

- (instancetype)initWithContent:(NSString*)content;

@property (nonatomic ,strong) NSString *content;

@end
