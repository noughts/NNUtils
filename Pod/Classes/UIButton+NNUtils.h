//
//  UIButton+NNUtils.h
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2015/02/12.
//  Copyright (c) 2015年 noughts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (NNUtils)

/// ボタンのタイトル変更
-(void)setTitle:(NSString *)title animated:(BOOL)animated;

/// 自身が配置されているUICollectionViewCell
-(UICollectionViewCell*)attachedCollectionViewCell;

/// 自身が配置されているUITableViewCell
-(UITableViewCell*)attachedTableViewCell;

@end
