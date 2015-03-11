//
//  UILabel+NNUtils.m
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2015/02/04.
//  Copyright (c) 2015年 noughts. All rights reserved.
//

#import "UILabel+NNUtils.h"

@implementation UILabel (NNUtils)

-(void)setTextColor:(UIColor *)textColor animated:(BOOL)animated{
	if( !animated ){
		[self setTextColor:textColor];
		return;
	}
	
	[UIView transitionWithView:self duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
		self.textColor = textColor;
	} completion:^(BOOL finished) {
	}];
}

@end
