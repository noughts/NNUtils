//
//  UIView+Utils.m
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2014/10/20.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "UIView+NNUtils.h"

@implementation UIView (NNUtils)



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
