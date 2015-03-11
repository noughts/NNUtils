//
//  UIImageView+Utils.h
//  UIImageView+UtilsDemo
//
//  Created by noughts on 2014/09/11.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (NNUtils)

/// ブラーをかける
-(void)applyBlurWithRaduis:(NSInteger)radius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor animated:(BOOL)animated;

/// アニメーション付きで画像をセット
-(void)setImage:(UIImage *)image animated:(BOOL)animated;

@end
