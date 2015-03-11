//
//  UIView+Utils.h
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2014/10/20.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NNUtils)


/// キーボード上下のNotificationに合わせてアニメーション
+ (void)animateWithKeyboardNotification:(NSNotification *)note animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion;



/// 現在の状態をキャプチャしたUIImageを返す
-(UIImage *)screenCaptureAfterScreenUpdates:(BOOL)afterUpdates;



/// 高さ制約を返す
-(NSLayoutConstraint*)heightConstraint;
/// 幅制約を返す
-(NSLayoutConstraint*)widthConstraint;

@end
