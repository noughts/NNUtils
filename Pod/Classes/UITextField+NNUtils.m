//
//  UITextField+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/03/23.
//
//

#import "UITextField+NNUtils.h"

@implementation UITextField (NNUtils)

/// placeholderの色を変更。※placeholderをセットした後に呼んでください
-(void)setPlaceholderColor:(UIColor*)color{
	if( !self.placeholder || self.placeholder.length == 0 ){
//		NBULogWarn(@"placeholderを指定した後に呼んでください");
		return;
	}
	self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:color}];
}


@end
