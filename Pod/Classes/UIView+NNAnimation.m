//
//  UIView+NNAnimation.m
//  Pods
//
//  Created by noughts on 2015/08/06.
//
//

#import "UIView+NNAnimation.h"

@implementation UIView (NNAnimation)

-(void)startGlowAnimation{
	UIViewAnimationOptions options = UIViewAnimationOptionAutoreverse | UIViewAnimationCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction;
	[UIView animateWithDuration:1 delay:0 options:options animations:^{
		self.tintColor = [UIColor whiteColor];
	} completion:^(BOOL finished) {
	}];
}

-(void)stopGlowAnimation{
	[UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
		self.tintColor = nil;
	} completion:NULL];
}


@end
