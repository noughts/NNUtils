#import "UIScrollView+NNUtils.h"

@implementation UIScrollView (NNUtils)

-(void)setScrollIndicatorInsetsTop:(CGFloat)value{
	self.scrollIndicatorInsets = UIEdgeInsetsMake( value, self.scrollIndicatorInsets.left, self.scrollIndicatorInsets.bottom, self.scrollIndicatorInsets.right );
}
-(void)setScrollIndicatorInsetsLeft:(CGFloat)value{
	self.scrollIndicatorInsets = UIEdgeInsetsMake( self.scrollIndicatorInsets.top, value, self.scrollIndicatorInsets.bottom, self.scrollIndicatorInsets.right );
}
-(void)setScrollIndicatorInsetsBottom:(CGFloat)value{
	self.scrollIndicatorInsets = UIEdgeInsetsMake( self.scrollIndicatorInsets.top, self.scrollIndicatorInsets.left, value, self.scrollIndicatorInsets.right );
}
-(void)setScrollIndicatorInsetsRight:(CGFloat)value{
	self.scrollIndicatorInsets = UIEdgeInsetsMake( self.scrollIndicatorInsets.top, self.scrollIndicatorInsets.left, self.scrollIndicatorInsets.bottom, value );
}


-(CGFloat)scrollIndicatorInsetsTop{
	return self.scrollIndicatorInsets.top;
}
-(CGFloat)scrollIndicatorInsetsLeft{
	return self.scrollIndicatorInsets.left;
}
-(CGFloat)scrollIndicatorInsetsBottom{
	return self.scrollIndicatorInsets.bottom;
}
-(CGFloat)scrollIndicatorInsetsRight{
	return self.scrollIndicatorInsets.right;
}



@end
