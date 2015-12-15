//
//  NSNotificationCenter+NNUtils.h
//  Pods
//
//  Created by noughts on 2015/12/15.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (NNUtils)

/// 一度だけobserveする
-(void)addObserverOnceForName:(nullable NSString *)name object:(nullable id)obj queue:(nullable NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *note))block;

@end


NS_ASSUME_NONNULL_END