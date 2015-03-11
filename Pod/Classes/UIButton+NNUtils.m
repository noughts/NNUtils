//
//  UIButton+NNUtils.m
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2015/02/12.
//  Copyright (c) 2015年 noughts. All rights reserved.
//

#import "UIButton+NNUtils.h"
#import <NBULog.h>

@implementation UIButton (NNUtils)

/// ボタンのタイトル変更
-(void)setTitle:(NSString *)title animated:(BOOL)animated{
	if( animated ){
		[self setTitle:title forState:UIControlStateNormal];
	} else {
		if( self.buttonType != UIButtonTypeCustom ){
			NBULogWarn(@"ボタンタイトルのアニメーションなし変更は、buttonType == UIButtonTypeCustom のみ動作する仕様のようです");
		}
		[UIView setAnimationsEnabled:NO];
		[self setTitle:title forState:UIControlStateNormal];/// UIButtonTypeCustom であることに注意
		[UIView setAnimationsEnabled:YES];
	}
}

/// 自身が配置されているUICollectionViewCell
-(UICollectionViewCell*)attachedCollectionViewCell{
	UIView* currentView = self;
	while (YES) {
		UIView* superView = currentView.superview;
		if( !superView ){
			return nil;
		}
		if( [superView isKindOfClass:[UICollectionViewCell class]] ){
			return (UICollectionViewCell*)superView;
		} else {
			currentView = superView;
		}
	}
}


/// 自身が配置されているUITableViewCell
-(UITableViewCell*)attachedTableViewCell{
	UIView* currentView = self;
	while (YES) {
		UIView* superView = currentView.superview;
		if( !superView ){
			return nil;
		}
		if( [superView isKindOfClass:[UITableViewCell class]] ){
			return (UITableViewCell*)superView;
		} else {
			currentView = superView;
		}
	}
}

@end
