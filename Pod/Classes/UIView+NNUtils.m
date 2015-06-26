//
//  UIView+Utils.m
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2014/10/20.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "UIView+NNUtils.h"
#import "CADisplayLink+NNUtils.h"

@implementation UIView (NNUtils)


/// 話すアニメ開始
-(void)startTalkAnimation{
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(talkAnimation:) name:@"onEnterFrame" object:[CADisplayLink sharedLink]];
}
-(void)talkAnimation:(NSNotification*)note{
	NSLog( @"hoge" );
}
/// 話すアニメ停止
-(void)stopTalkAnimation{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"onEnterFrame" object:[CADisplayLink sharedLink]];
}



UIViewAnimationOptions curveOptionsFromCurve(UIViewAnimationCurve curve){
	switch (curve)	{
		case UIViewAnimationCurveEaseInOut:
			return UIViewAnimationOptionCurveEaseInOut;
		case UIViewAnimationCurveEaseIn:
			return UIViewAnimationOptionCurveEaseIn;
		case UIViewAnimationCurveEaseOut:
			return UIViewAnimationOptionCurveEaseOut;
		case UIViewAnimationCurveLinear:
			return UIViewAnimationOptionCurveLinear;
		default:
			return curve << 16;
	}
}


/// キーボード上下のNotificationに合わせてアニメーション
+ (void)animateWithKeyboardNotification:(NSNotification *)note animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion{
	UIViewAnimationOptions curveOptions = curveOptionsFromCurve([note.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue]);
	[UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] integerValue] delay:0 options:curveOptions animations:animations completion:completion];
}



/// 指定したview内でのrectを返す
-(CGRect)rectInView:(UIView*)view{
	return [self convertRect:self.bounds toView:view];
}


-(UILabel*)labelWithTag:(NSInteger)tag{
	UIView* view = [self viewWithTag:tag];
	if( [view isKindOfClass:[UILabel class]] == NO ){
		return nil;
	}
	return (UILabel*)view;
}


-(UIImageView*)imageViewWithTag:(NSInteger)tag{
	UIView* view = [self viewWithTag:tag];
	if( [view isKindOfClass:[UIImageView class]] == NO ){
		return nil;
	}
	return (UIImageView*)view;
}

-(UIButton*)buttonWithTag:(NSInteger)tag{
	UIView* view = [self viewWithTag:tag];
	if( [view isKindOfClass:[UIButton class]] == NO ){
		return nil;
	}
	return (UIButton*)view;
}





/// 現在の状態をキャプチャしたUIImageを返す
-(UIImage *)screenCaptureAfterScreenUpdates:(BOOL)afterUpdates{
	UIImage *capture;
	UIGraphicsBeginImageContextWithOptions(self.frame.size , NO , 1.0 );
	[self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
	capture = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return capture;
}






/// 高さ制約を返す
-(NSLayoutConstraint*)heightConstraint{
	for (NSLayoutConstraint* constraint in self.constraints) {
		if( constraint.firstAttribute == NSLayoutAttributeHeight && constraint.secondAttribute == NSLayoutAttributeNotAnAttribute ){
			return constraint;
		}
	}
	return nil;
}

/// 幅制約を返す
-(NSLayoutConstraint*)widthConstraint{
	for (NSLayoutConstraint* constraint in self.constraints) {
		if( constraint.firstAttribute == NSLayoutAttributeWidth && constraint.secondAttribute == NSLayoutAttributeNotAnAttribute ){
			return constraint;
		}
	}
	return nil;
}




@end
