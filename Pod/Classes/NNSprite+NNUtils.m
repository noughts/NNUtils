//
//  NNSprite+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/06/26.
//
//

#import "NNSprite+NNUtils.h"
#import "NNUtils.h"

@implementation NNSprite (NNUtils)

-(void)startTalkAnimation{
	[self setOnEnterFrameHandler:^(NNSprite *sprite, NSUInteger counter) {
		CGFloat scaleDistance = sprite.scaleX - 1;
		sprite.scaleX -= scaleDistance / 6;
		sprite.scaleY -= scaleDistance / 6;
		
		CGFloat rotationDistance = sprite.rotation;
		sprite.rotation -= rotationDistance / 6;
		if( counter % 60 == 0 ){
			sprite.scaleX = sprite.scaleY = 1.2;
			sprite.rotation = [NNUtils randWithMin:-10 max:10];
		}
	}];
}
-(void)stopTalkAnimation{
	[self setOnEnterFrameHandler:nil];
}

@end
