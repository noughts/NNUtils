//
//  NSObject+Utils.h
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2014/11/17.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NNUtils)

/// 指定したプロパティ以外をdump。出力できないプロパティを出力しようとしてクラッシュすることを防ぎます。
-(void)dumpWithIgnorePropertyNames:(NSArray*)ignorePropertyNames;

@end
