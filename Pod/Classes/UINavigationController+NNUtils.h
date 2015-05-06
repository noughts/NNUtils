//
//  UINavigationController+NNUtils.h
//  Pods
//
//  Created by noughts on 2015/05/06.
//
//

#import <UIKit/UIKit.h>

@interface UINavigationController (NNUtils)

/// フェードでpush
-(void)pushViewController:(UIViewController *)viewController animatedWithFade:(BOOL)animatedWithFade;

/// フェードでpop
-(UIViewController*)popViewControllerAnimatedWithFade:(BOOL)animatedWithFade;

@end
