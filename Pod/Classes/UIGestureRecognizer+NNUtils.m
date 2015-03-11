//
//  UIGestureRecognizer+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/02/12.
//
//

#import "UIGestureRecognizer+NNUtils.h"

@implementation UIGestureRecognizer (NNUtils)

/// 自身に関連付けられているUICollectionViewCell
-(UICollectionViewCell*)attachedCollectionViewCell{
	UIView* currentView = self.view;
	while (YES) {
		if( !currentView ){
			return nil;
		}
		if( [currentView isKindOfClass:[UICollectionViewCell class]] ){
			return (UICollectionViewCell*)currentView;
		} else {
			currentView = currentView.superview;
		}
	}
}

/// 自身に関連付けられているUITableViewCell
-(UITableViewCell*)attachedTableViewCell{
	UIView* currentView = self.view;
	while (YES) {
		if( !currentView ){
			return nil;
		}
		if( [currentView isKindOfClass:[UITableViewCell class]] ){
			return (UITableViewCell*)currentView;
		} else {
			currentView = currentView.superview;
		}
	}
}

@end
