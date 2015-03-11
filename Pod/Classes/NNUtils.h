//
//  NNUtils.h
//  Pods
//
//  Created by noughts on 2015/02/12.
//
//

#import <Foundation/Foundation.h>

@interface NNUtils : NSObject

/// 画面の縦横比
+(CGFloat)screenAspectRatio;

/// JavaScript の setTimetout
+(void)setTimeout:(void(^)(void))block delay:(float)delay;

+(NSUInteger)screenHeight;
+(NSUInteger)screenWidth;

@end
