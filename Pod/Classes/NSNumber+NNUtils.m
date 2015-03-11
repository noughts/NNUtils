//
//  NSNumber+NNUtils.m
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2014/11/30.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "NSNumber+NNUtils.h"

@implementation NSNumber (NNUtils)

/// インクリメントしたNSNumberを返す
// 仕様上、このようにしかできません
+(NSNumber*)increment:(NSNumber*)number{
	NSInteger value = number.integerValue;
	return @(value + 1);
}


@end
