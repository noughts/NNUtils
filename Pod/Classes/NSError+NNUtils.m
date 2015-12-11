//
//  NSError+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/12/11.
//
//

#import "NSError+NNUtils.h"

@implementation NSError (NNUtils)

/// エラーメッセージからNSErrorを作成
+(NSError*)createWithMessage:(NSString*)message code:(int)code{
	NSMutableDictionary* errDetails = [NSMutableDictionary dictionary];
	[errDetails setValue:message forKey:NSLocalizedDescriptionKey];
	NSError* error = [[NSError alloc] initWithDomain:@"noughts" code:code userInfo:errDetails];
	return error;
}

@end
