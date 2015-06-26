#import "CADisplayLink+NNUtils.h"






@interface Hoge : NSObject
@end

@implementation Hoge

-(void)update:(CADisplayLink *)link{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"onEnterFrame" object:link];
}

@end








@implementation CADisplayLink (NNUtils)

static CADisplayLink* _sharedLink = nil;

+ (CADisplayLink*)sharedLink{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		Hoge* hoge = [Hoge new];
		_sharedLink = [CADisplayLink displayLinkWithTarget:hoge selector:@selector(update:)];
		[_sharedLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
	});
	return _sharedLink;
}




@end





