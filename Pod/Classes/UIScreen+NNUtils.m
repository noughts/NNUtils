//
//  UIScreen+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/11/09.
//
//

#import "UIScreen+NNUtils.h"

@implementation UIScreen (NNUtils)


/// 3:4画面か
-(BOOL)is3by4{
	return (float)[self screenHeight] / [self screenWidth] == 1.5;
}


/// 画面の縦横比
-(CGFloat)screenAspectRatio{
	return (CGFloat)[self screenWidth] / (CGFloat)[self screenHeight];
}


-(NSUInteger)screenHeight{
	if( [self respondsToSelector:@selector(nativeBounds)] ){
		return self.nativeBounds.size.height / self.nativeScale;
	} else {
		return self.bounds.size.height;
	}
}
-(NSUInteger)screenWidth{
	if( [self respondsToSelector:@selector(nativeBounds)] ){
		return self.nativeBounds.size.width  / self.nativeScale;
	} else {
		return self.bounds.size.width;
	}
}






@end
