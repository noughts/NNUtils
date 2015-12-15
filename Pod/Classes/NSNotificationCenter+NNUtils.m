//
//  NSNotificationCenter+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/12/15.
//
//

#import "NSNotificationCenter+NNUtils.h"



@implementation NSNotificationCenter (NNUtils)


/// 一度だけobserveする
-(void)addObserverOnceForName:(nullable NSString *)name object:(nullable id)obj queue:(nullable NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *note))block{
	__block id observer;
	__weak typeof(self) _self = self;
	observer = [self addObserverForName:name object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
		[_self removeObserver:observer];
		block( note );
	}];
}

@end



