//
//  UIView+Utils.h
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2014/10/20.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NNUtils)


/// 話すアニメ開始
-(void)startTalkAnimation;
/// 話すアニメ停止
-(void)stopTalkAnimation;

/// キーボード上下のNotificationに合わせてアニメーション
+ (void)animateWithKeyboardNotification:(NSNotification *)note animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion;


/// 指定したview内でのrectを返す
-(CGRect)rectInView:(UIView*)view;

-(UILabel*)labelWithTag:(NSInteger)tag;
-(UIImageView*)imageViewWithTag:(NSInteger)tag;
-(UIButton*)buttonWithTag:(NSInteger)tag;

/// 現在の状態をキャプチャしたUIImageを返す
-(UIImage *)screenCaptureAfterScreenUpdates:(BOOL)afterUpdates;



/// 高さ制約を返す
-(NSLayoutConstraint*)heightConstraint;
/// 幅制約を返す
-(NSLayoutConstraint*)widthConstraint;

@end
