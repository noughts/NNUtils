//
//  UIViewController+NNUtils.h
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2014/12/25.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NNUtils)

/// 指定したViewControllerを子として追加
- (void)addContentController:(UIViewController *)content animated:(BOOL)animated;


/// 自分自身を親ViewControllerから削除
-(void)removeFromContainerControllerAnimated:(BOOL)animated;

/// 指定したViewControllerを親から削除
-(void)removeContentController:(UIViewController*)content animated:(BOOL)animated;

@end
