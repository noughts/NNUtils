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
	[self setOnEnterFrameHandler:^(NNSprite *sprite) {
		NSLog( @"1" );
		CGFloat distance = sprite.scaleX - 1;
		sprite.scaleX -= distance / 2;
		sprite.scaleY -= distance / 2;
	}];
}
-(void)stopTalkAnimation{
	[self setOnEnterFrameHandler:nil];
}

@end
