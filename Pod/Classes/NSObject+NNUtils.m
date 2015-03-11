//
//  NSObject+Utils.m
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2014/11/17.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "NSObject+NNUtils.h"
#import "objc/runtime.h"

@implementation NSObject (NNUtils)

/// 指定したプロパティ以外をdump。出力できないプロパティを出力しようとしてクラッシュすることを防ぎます。
-(void)dumpWithIgnorePropertyNames:(NSArray*)ignorePropertyNames{
	unsigned int outCount, i;
	objc_property_t *properties = class_copyPropertyList([self class], &outCount);
	for (i = 0; i < outCount; i++) {
		objc_property_t property = properties[i];
		const char *name = property_getName(property);
		NSString *propertyName = [NSString stringWithUTF8String:name];
		
		/// 出力できないプロパティを無視
		BOOL shouldContinue = NO;
		for (NSString* ignorePropName in ignorePropertyNames) {
			if( [propertyName isEqualToString:ignorePropName] ){
				shouldContinue = YES;
			}
		}
		if( shouldContinue ){
			continue;
		}
		
		NSString *propertyValue = [self valueForKey:propertyName];
		NSLog( @"%@ -> %@", propertyName, propertyValue );
	}
	free(properties);
}


@end
