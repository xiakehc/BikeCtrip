//
//  NSArray+CTExtensions.h
//  CTFoundation
//
//  Created by yuki on 15-4-13.
//  Copyright (c) 2014年 Yuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(CTExtensions)

/**
 *  替代Foundation的objectAtIndex，做了越界校验
 *
 *  @param index 数组index
 *
 *  @return 返回数组中的index对应的值,index越界时候返回NULL
 */
- (id)objectAtIndexForBike:(NSUInteger)index;

@end

@interface NSMutableArray(Safe)

/**
 *  对非NULL的NSMutableArray做添加操作
 *
 *  @param obj 添加的对象
 */
- (void)addObjectForBikeCtrip:(id)obj;

@end