#import <NNSprite.h>

@interface NNSprite (NNUtils)

/// 心拍アニメーション開始
-(void)startBeatAnimationWithInterval:(NSUInteger)interval scaleRatio:(CGFloat)scaleRatio;

/// 心拍アニメーション開始
-(void)startBeatAnimationWithInterval:(NSUInteger)interval;

/// 心拍アニメーション停止
-(void)stopBeatAnimation;

@end
