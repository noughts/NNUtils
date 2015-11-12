//
//  NSDictionary+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/11/12.
//
//

#import "NSDictionary+NNUtils.h"

@implementation NSDictionary (NNUtils)

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

@end
