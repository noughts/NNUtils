//
//  UIScreen+NNUtils.h
//  Pods
//
//  Created by noughts on 2015/11/09.
//
//

#import <UIKit/UIKit.h>

@interface UIScreen (NNUtils)

/// 3:4画面か
-(BOOL)is3by4;

/// 画面の縦横比
-(CGFloat)screenAspectRatio;
-(NSUInteger)screenHeight;
-(NSUInteger)screenWidth;


@end
