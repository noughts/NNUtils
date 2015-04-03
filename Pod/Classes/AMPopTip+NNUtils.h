//
//  AMPopTip+NNUtils.h
//  Pods
//
//  Created by noughts on 2015/04/03.
//
//

#import "AMPopTip.h"

@interface AMPopTip (NNUtils)

/// 指定したUIBarButtonItemからPopTipを表示(大抵の場合、inViewはUINavigationController.viewを指定する必要があります)
- (void)showText:(NSString *)text direction:(AMPopTipDirection)direction maxWidth:(CGFloat)maxWidth inView:(UIView *)view fromBarButtonItem:(UIBarButtonItem*)barButtonItem;

/// 指定したUIBarButtonItemからPopTipを表示(大抵の場合、inViewはUINavigationController.viewを指定する必要があります)
- (void)showAttributedText:(NSAttributedString *)text direction:(AMPopTipDirection)direction maxWidth:(CGFloat)maxWidth inView:(UIView *)view fromBarButtonItem:(UIBarButtonItem*)barButtonItem;

/// 指定したViewからPopTipを表示
- (void)showText:(NSString *)text direction:(AMPopTipDirection)direction maxWidth:(CGFloat)maxWidth inView:(UIView *)view fromView:(UIView*)fromView;

/// 指定したViewからPopTipを表示
- (void)showAttributedText:(NSAttributedString *)text direction:(AMPopTipDirection)direction maxWidth:(CGFloat)maxWidth inView:(UIView *)view fromView:(UIView*)fromView;

/// 指定したViewからPopTipを表示
- (void)showText:(NSString *)text direction:(AMPopTipDirection)direction maxWidth:(CGFloat)maxWidth inView:(UIView *)view fromView:(UIView*)fromView duration:(NSTimeInterval)interval;

/// 指定したViewからPopTipを表示
- (void)showAttributedText:(NSAttributedString *)text direction:(AMPopTipDirection)direction maxWidth:(CGFloat)maxWidth inView:(UIView *)view fromView:(UIView*)fromView duration:(NSTimeInterval)interval;

@end
