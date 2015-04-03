#import "AMPopTip+NNUtils.h"
#import "UIView+NNUtils.h"

@implementation AMPopTip (NNUtils)


/// 指定したUIBarButtonItemからPopTipを表示
- (void)showText:(NSString *)text direction:(AMPopTipDirection)direction maxWidth:(CGFloat)maxWidth inView:(UIView *)view fromBarButtonItem:(UIBarButtonItem*)barButtonItem{
	UIView* fromView = [barButtonItem valueForKey:@"view"];
	[self showText:text direction:direction maxWidth:maxWidth inView:view fromView:fromView];
}

/// 指定したUIBarButtonItemからPopTipを表示
- (void)showAttributedText:(NSAttributedString *)text direction:(AMPopTipDirection)direction maxWidth:(CGFloat)maxWidth inView:(UIView *)view fromBarButtonItem:(UIBarButtonItem*)barButtonItem{
	UIView* fromView = [barButtonItem valueForKey:@"view"];
	[self showAttributedText:text direction:direction maxWidth:maxWidth inView:view fromView:fromView];
}



/// 指定したViewからPopTipを表示
- (void)showText:(NSString *)text direction:(AMPopTipDirection)direction maxWidth:(CGFloat)maxWidth inView:(UIView *)view fromView:(UIView*)fromView{
	CGRect rect = [fromView rectInView:view];
	[self showText:text direction:direction maxWidth:maxWidth inView:view fromFrame:rect];
}

/// 指定したViewからPopTipを表示
- (void)showAttributedText:(NSAttributedString *)text direction:(AMPopTipDirection)direction maxWidth:(CGFloat)maxWidth inView:(UIView *)view fromView:(UIView*)fromView{
	CGRect rect = [fromView rectInView:view];
	[self showAttributedText:text direction:direction maxWidth:maxWidth inView:view fromFrame:rect];
}

/// 指定したViewからPopTipを表示
- (void)showText:(NSString *)text direction:(AMPopTipDirection)direction maxWidth:(CGFloat)maxWidth inView:(UIView *)view fromView:(UIView*)fromView duration:(NSTimeInterval)interval{
	CGRect rect = [fromView rectInView:view];
	[self showText:text direction:direction maxWidth:maxWidth inView:view fromFrame:rect duration:interval];
}

/// 指定したViewからPopTipを表示
- (void)showAttributedText:(NSAttributedString *)text direction:(AMPopTipDirection)direction maxWidth:(CGFloat)maxWidth inView:(UIView *)view fromView:(UIView*)fromView duration:(NSTimeInterval)interval{
	CGRect rect = [fromView rectInView:view];
	[self showAttributedText:text direction:direction maxWidth:maxWidth inView:view fromFrame:rect duration:interval];
}


@end
