/*
 
 UIAppearance では UITableViewCell の色をグローバルで変えられないので、こんなかんじでプロキシを用意するのが良さそうです。
 

 [[UITableViewCell appearance] setTextLabelColor:[UIColor yellowColor]];
 
 
 */

#import "UITableViewCell+AppearanceProxy.h"

@implementation UITableViewCell (AppearanceProxy)

-(void)setTextLabelColor:(UIColor*)color{
	self.textLabel.textColor = color;
}

-(void)setDetailTextLabelColor:(UIColor*)color{
	self.detailTextLabel.textColor = color;
}

@end
