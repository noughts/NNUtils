//
//  NSMutableArray+NNUtils.m
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2014/11/30.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "NSMutableArray+NNUtils.h"

@implementation NSMutableArray (NNUtils)

-(id)pop{
	id object = self.lastObject;
	[self removeLastObject];
	return object;
}

@end
