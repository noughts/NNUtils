//
//  UINavigationController+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/05/06.
//
//

#import "UINavigationController+NNUtils.h"

@implementation UINavigationController (NNUtils)

/// フェードでpush
-(void)pushViewController:(UIViewController *)viewController animatedWithFade:(BOOL)animatedWithFade{
	if( animatedWithFade == NO ){
		[self pushViewController:viewController animated:NO];
		return;
	}
	CATransition* transition = [CATransition animation];
	transition.duration = 0.25;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type = kCATransitionFade;
	[self.view.layer addAnimation:transition forKey:nil];
	[self pushViewController:viewController animated:NO];
}


/// フェードでpop
-(UIViewController*)popViewControllerAnimatedWithFade:(BOOL)animatedWithFade{
	if( animatedWithFade == NO ){
		return [self popViewControllerAnimated:NO];
	}
	CATransition* transition = [CATransition animation];
	transition.duration = 0.25;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type = kCATransitionFade;
	[self.view.layer addAnimation:transition forKey:nil];
	return [self popViewControllerAnimated:NO];
}



@end
