//
//  NNUtils.h
//  Pods
//
//  Created by noughts on 2015/02/12.
//
//

#import <Foundation/Foundation.h>

@interface NNUtils : NSObject

/// OKボタンを押して処理を実行できるアラートを表示
+(void)showAlertFromViewController:(UIViewController*)fromViewController message:(NSString*)message handler:(void (^)(UIAlertAction *action))handler;

/// 指定したレンジ内のランダム数を返す
+(CGFloat)randWithMin:(CGFloat)min max:(CGFloat)max;

/// アラート表示
+(void)alert:(NSString*)message;

/// 画面の縦横比
+(CGFloat)screenAspectRatio;

/// JavaScript の setTimetout
+(void)setTimeout:(void(^)(void))block delay:(float)delay;

+(NSUInteger)screenHeight;
+(NSUInteger)screenWidth;

@end
