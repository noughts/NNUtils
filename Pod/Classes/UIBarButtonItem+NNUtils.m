//
//  UIBarButtonItem+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/03/11.
//
//

#import "UIBarButtonItem+NNUtils.h"

@implementation UIBarButtonItem (NNUtils)

/// アニメーションの有無を選べる setTitle
-(void)setTitle:(NSString *)title animated:(BOOL)animated{
	if( animated ){
		[self setTitle:title];
	} else {
		[UIView setAnimationsEnabled:NO];
		[self setTitle:title];
		[UIView setAnimationsEnabled:YES];
	}
}

@end
