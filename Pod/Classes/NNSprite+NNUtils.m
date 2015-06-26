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

-(void)startBeatAnimation{
	__block NSUInteger i = 0;
	[self setOnEnterFrameHandler:^(NNSprite *sprite, NSUInteger counter) {
		CGFloat scaleDistance = sprite.scaleX - 1;
		sprite.scaleX -= scaleDistance / 6;
		sprite.scaleY -= scaleDistance / 6;
		
		CGFloat rotationDistance = sprite.rotation;
		sprite.rotation -= rotationDistance / 6;
		if( i % 60 == 0 ){
			sprite.scaleX = sprite.scaleY = 1.2;
			sprite.rotation = [NNUtils randWithMin:-10 max:10];
		}
		i++;
	}];
}
-(void)stopBeatAnimation{
	[self setOnEnterFrameHandler:nil];
	self.scaleX = 1;
	self.scaleY = 1;
	self.rotation = 0;
}

@end
