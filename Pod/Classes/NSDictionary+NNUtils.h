//
//  NSDictionary+NNUtils.h
//  Pods
//
//  Created by noughts on 2015/11/12.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NNUtils)

/// 指定したキーのみを含むか？
-(BOOL)isOnlyContainsKeys:(NSArray<NSString*>*)keys;

@end
