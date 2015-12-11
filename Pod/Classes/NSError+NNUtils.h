//
//  NSError+NNUtils.h
//  Pods
//
//  Created by noughts on 2015/12/11.
//
//

#import <Foundation/Foundation.h>

@interface NSError (NNUtils)

/// エラーメッセージからNSErrorを作成
+(NSError*)createWithMessage:(NSString*)message code:(int)code;

@end
