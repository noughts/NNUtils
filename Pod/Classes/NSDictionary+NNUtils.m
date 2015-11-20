//
//  NSDictionary+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/11/12.
//
//

#import "NSDictionary+NNUtils.h"

@implementation NSDictionary (NNUtils)

/// JSON-Safeなdictionaryに変換
-(NSDictionary*)JSONSafeDictionary{
	NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithDictionary:self];
	NSArray* allKeys = [dict allKeys];
	for (int i=0; i<allKeys.count; i++) {
		NSString* key = allKeys[i];
		id value = dict[key];
		dict[key] = [value description];
	}
	return [NSDictionary dictionaryWithDictionary:dict];
}


/// 指定したキーのみを含むか？
-(BOOL)isOnlyContainsKeys:(NSArray<NSString*>*)keys{
	if( self.count != keys.count ){
		return NO;
	}
	
	for (NSString* key in keys) {
		if( ![self valueForKey:key] ){
			return NO;
		}
	}
	return YES;
}

/// 指定したキーのみを含むか？
-(BOOL)isOnlyContainsKey:(NSString*)key{
	if( self.count != 1 ){
		return NO;
	}
	
	if( ![self valueForKey:key] ){
		return NO;
	}
	return YES;
}


@end
