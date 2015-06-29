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

-(void)startBeatAnimationWithInterval:(NSUInteger)interval scaleRatio:(CGFloat)scaleRatio{
	__block NSUInteger i = 0;
	[self setOnEnterFrameHandler:^(NNSprite *sprite) {
		CGFloat scaleDistance = sprite.scaleX - 1;
		sprite.scaleX -= scaleDistance / 6;
		sprite.scaleY -= scaleDistance / 6;
		
		CGFloat rotationDistance = sprite.rotation;
		sprite.rotation -= rotationDistance / 6;
		if( i % interval == 0 ){
			sprite.scaleX = sprite.scaleY = scaleRatio;
			sprite.rotation = [NNUtils randWithMin:-10 max:10];
		}
		i++;
	}];
}

-(void)startBeatAnimationWithInterval:(NSUInteger)interval{
	[self startBeatAnimationWithInterval:interval scaleRatio:1.5];
}
-(void)stopBeatAnimation{
	[self setOnEnterFrameHandler:nil];
	self.scaleX = 1;
	self.scaleY = 1;
	self.rotation = 0;
}

@end
