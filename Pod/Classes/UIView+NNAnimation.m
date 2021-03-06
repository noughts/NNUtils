//
//  UIView+NNAnimation.m
//  Pods
//
//  Created by noughts on 2015/08/06.
//
//

#import "UIView+NNAnimation.h"

@implementation UIView (NNAnimation)





/// フェードイン
-(void)fadeIn{
	if( self.alpha == 1 && self.hidden == NO ){
		return;
	}
	self.alpha = 0;
	self.hidden = NO;
	
	[UIView animateWithDuration:0.25 animations:^{
		self.alpha = 1;
	}];
}


/// delayありフェードイン
-(void)fadeInWithDelay:(float)delay{
	self.alpha = 0;
	self.hidden = NO;
	[UIView animateWithDuration:0.25 animations:^{
		self.alpha = 1;
	}];
}



/// フェードアウト
-(void)fadeOut{
	[self fadeOutWithCompletion:nil];
}

/// フェードアウト
-(void)fadeOutWithCompletion:(void (^)(BOOL finished))completion{
	// アニメーションが重複するとスキップしてしまうので無視
	if( [self.layer.animationKeys containsObject:@"opacity"] ){
		return;
	}
	
	[UIView animateWithDuration:0.25 animations:^{
		self.alpha = 0;
	} completion:^(BOOL finished) {
		self.hidden = YES;
		if( completion ){
			completion( finished );
		}
	}];
}


/// delayありフェードアウト
-(void)fadeOutWithDelay:(float)delay{
	// アニメーションが重複するとスキップしてしまうので無視
	if( [self.layer.animationKeys containsObject:@"opacity"] ){
		return;
	}
	
	[UIView animateWithDuration:0.25 delay:delay options:0 animations:^{
		self.alpha = 0;
	} completion:^(BOOL finished) {
		self.hidden = YES;
	}];
}



/// 以下は、AHEasing が最新のcocoapodsだと依存できないので、解決できるまでオミット


/*
/// 微妙に縮小しながらフェードアウト
-(void)fadeOutWithScale:(float)delay{
	[UIView animateWithDuration:0.2 delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
		[self setEasingFunction:QuarticEaseOut forKeyPath:@"transform"];
		self.transform = CGAffineTransformMakeScale( 0.9, 0.9 );
		self.alpha = 0;
	} completion:^(BOOL finished) {
		self.hidden = YES;
		self.alpha = 1;
		[self removeEasingFunctionForKeyPath:@"transform"];
	}];
}




/// 微妙に拡大しながらフェードイン
-(void)fadeInWithScale:(float)delay{
	self.transform = CGAffineTransformMakeScale( 0.9, 0.9 );
	self.hidden = NO;
	self.alpha = 0;
	
	[UIView animateWithDuration:0.25 delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
		[self setEasingFunction:QuarticEaseOut forKeyPath:@"transform"];
		self.transform = CGAffineTransformMakeScale( 1, 1 );
		self.alpha = 1;
	} completion:^(BOOL finished) {
		[self removeEasingFunctionForKeyPath:@"transform"];
	}];
}
 
 
 /// ポップして表示アニメ
 -(void)popInAnime:(float)delay{
	self.hidden = NO;
	self.transform = CGAffineTransformMakeScale(0,0);
	
	[UIView animateWithDuration:0.2 delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
 [self setEasingFunction:BackEaseOut forKeyPath:@"transform"];
 self.transform = CGAffineTransformMakeScale(1.0, 1.0);
	} completion:^(BOOL finished) {
 [self removeEasingFunctionForKeyPath:@"transform"];
	}];
 }
 
 
 /// 微妙に拡大&ポップしながらフェードイン
 -(void)fadePopIn:(float)delay{
	self.transform = CGAffineTransformMakeScale( 0.9, 0.9 );
	self.hidden = NO;
	self.alpha = 0;
	
	[UIView animateWithDuration:0.25 delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
 [self setEasingFunction:BackEaseOut forKeyPath:@"transform"];
 self.transform = CGAffineTransformMakeScale( 1, 1 );
 self.alpha = 1;
	} completion:^(BOOL finished) {
 [self removeEasingFunctionForKeyPath:@"transform"];
	}];
 }


 */






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
