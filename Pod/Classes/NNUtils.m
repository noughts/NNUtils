//
//  NNUtils.m
//  Pods
//
//  Created by noughts on 2015/02/12.
//
//

#import "NNUtils.h"

@implementation NNUtils

/// JavaScript の setTimetout
+(void)setTimeout:(void(^)(void))block delay:(float)delay{
	[NSTimer scheduledTimerWithTimeInterval:delay target:[NSBlockOperation blockOperationWithBlock:block] selector:@selector(main) userInfo:nil repeats:NO];
}


/// 画面の縦横比
+(CGFloat)screenAspectRatio{
	return (CGFloat)[self screenWidth] / (CGFloat)[self screenHeight];
}


+(NSUInteger)screenHeight{
	if( [[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ){
		return [UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale;
	} else {
		return [UIScreen mainScreen].bounds.size.height;
	}
}
+(NSUInteger)screenWidth{
	if( [[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ){
		return [UIScreen mainScreen].nativeBounds.size.width  / [UIScreen mainScreen].nativeScale;
	} else {
		return [UIScreen mainScreen].bounds.size.width;
	}
}


@end
