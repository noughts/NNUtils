//
//  NNSprite+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/06/26.
//
//

#import "NNSprite+NNUtils.h"

@implementation NNSprite (NNUtils)

-(void)startTalkAnimation{
	[self setOnEnterFrameHandler:^{
		CGFloat distance = self.scaleX - 1;
		self.scaleX -= distance / 2;
		self.scaleY -= distance / 2;
	}];
}
-(void)stopTalkAnimation{
	[self setOnEnterFrameHandler:nil];
}

@end
