//
//  NSString+Utils.h
//  NSString+UtilsDemo
//
//  Created by noughts on 2014/09/02.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NNUtils)

/// はじめの文字を大文字にした文字列を返す。Cocoa標準のcapitalizedStringだと、"addMember" -> "Addmember" になるが、これは "AddMember"になります。
- (NSString*)capitalizedFirstLetterString;

/// よみがなを取得
-(NSString*)yomigana;

@end
