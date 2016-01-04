//
//  NSArray+CTExtensions.h
//  CTFoundation
//
//  Created by yuki on 15-4-13.
//  Copyright (c) 2014年 Yuki. All rights reserved.
//

#import "NSArray+CTExtensions.h"
#import <UIKit/UIKit.h>

@implementation NSArray(CTExtensions)

- (id)objectAtIndexForBike:(NSUInteger)index {
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    return NULL;
}

@end

@implementation NSMutableArray(Safe)

- (void)addObjectForBikeCtrip:(id)obj {
    if (obj != NULL) {
        [self addObject:obj];
    }
}

@end