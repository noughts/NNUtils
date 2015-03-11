//
//  UIGestureRecognizer+NNUtils.h
//  Pods
//
//  Created by noughts on 2015/02/12.
//
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (NNUtils)

/// 自身に関連付けられているUICollectionViewCell
-(UICollectionViewCell*)attachedCollectionViewCell;

/// 自身に関連付けられているUITableViewCell
-(UITableViewCell*)attachedTableViewCell;

@end
