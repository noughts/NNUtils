//
//  NNUtils.m
//  Pods
//
//  Created by noughts on 2015/02/12.
//
//

#import "NNUtils.h"

@implementation NNUtils

/// 指定したレンジ内のランダム数を返す
+(CGFloat)randWithMin:(CGFloat)min max:(CGFloat)max{
	NSInteger precise = 10000;
	NSInteger gap = max - min;
	NSInteger a = arc4random() % (gap * precise);
	return a/(float)precise + min;
}

/// アラート表示
+(void)alert:(NSString*)message{
	UIAlertView* alert = [UIAlertView new];
	alert.title = @"";
	alert.message = message;
	[alert addButtonWithTitle:@"OK"];
	[alert show];
}


/// OKボタンを押して処理を実行できるアラートを表示
+(void)showAlertFromViewController:(UIViewController*)fromViewController message:(NSString*)message handler:(void (^)(UIAlertAction *action))handler{
	UIAlertController* vc = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction* action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:handler];
	[vc addAction:action];
	[fromViewController presentViewController:vc animated:YES completion:nil];
}







/// JavaScript の setTimetout
+(void)setTimeout:(void(^)(void))block delay:(float)delay{
	[NSTimer scheduledTimerWithTimeInterval:delay target:[NSBlockOperation blockOperationWithBlock:block] selector:@selector(main) userInfo:nil repeats:NO];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        block();
//    });
}


/// 画面の縦横比
+(CGFloat)screenAspectRatio{
	return (CGFloat)[self screenWidth] / (CGFloat)[self screenHeight];
}


+(NSUInteger)screenHeight{
	if( [[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ){
		return [UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale;
	} else {
		return [UIScreen mainScreen].bounds.size.height;
	}
}
+(NSUInteger)screenWidth{
	if( [[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ){
		return [UIScreen mainScreen].nativeBounds.size.width  / [UIScreen mainScreen].nativeScale;
	} else {
		return [UIScreen mainScreen].bounds.size.width;
	}
}


@end
