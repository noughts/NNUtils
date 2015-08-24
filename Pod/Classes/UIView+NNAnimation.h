//
//  UIView+NNAnimation.h
//  Pods
//
//  Created by noughts on 2015/08/06.
//
//

#import <UIKit/UIKit.h>

@interface UIView (NNAnimation)

/// フェードイン
-(void)fadeIn;

/// フェードアウト
-(void)fadeOut;
-(void)fadeOutWithCompletion:(void (^)(BOOL finished))completion;

/// ポップして表示アニメ
-(void)popInAnime:(float)delay;

/// 微妙に拡大&ポップしながらフェードイン
-(void)fadePopIn:(float)delay;

/// フェードイン
-(void)fadeInWithDelay:(float)delay;

/// 微妙に拡大しながらフェードイン
-(void)fadeInWithScale:(float)delay;

/// フェードアウト
-(void)fadeOutWithDelay:(float)delay;

/// 微妙に縮小しながらフェードアウト
-(void)fadeOutWithScale:(float)delay;


-(void)startGlowAnimation;
-(void)stopGlowAnimation;

@end
