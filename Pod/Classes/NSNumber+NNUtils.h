//
//  NSNumber+NNUtils.h
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2014/11/30.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (NNUtils)

/// インクリメントしたNSNumberを返す
// 仕様上、このようにしかできません
+(NSNumber*)increment:(NSNumber*)number;

@end
