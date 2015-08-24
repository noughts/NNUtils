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


/// フェードイン
-(void)fadeInWithDelay:(float)delay;


/// フェードアウト
-(void)fadeOutWithDelay:(float)delay;



-(void)startGlowAnimation;
-(void)stopGlowAnimation;

@end
