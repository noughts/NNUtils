//
//  NSString+Utils.h
//  NSString+UtilsDemo
//
//  Created by noughts on 2014/09/02.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NNUtils)

/// 文字列からNSURLの配列を抽出
- (NSArray*)extractURLs;

/// iOS7以前用のcontainsString;
-(BOOL)containsStringForiOS7:(NSString *)aString;

/// 自身が数字のみで構成されているかチェック
-(BOOL)isNumeric;

/// 自身がアルファベットと数字のみで構成されているかチェック
-(BOOL)isAlphaNumeric;

/// 自身がアルファベットのみで構成されているかチェック
-(BOOL)isAlphabetic;


/// はじめの文字を大文字にした文字列を返す。Cocoa標準のcapitalizedStringだと、"addMember" -> "Addmember" になるが、これは "AddMember"になります。
- (NSString*)capitalizedFirstLetterString;

/// よみがなを取得
-(NSString*)yomigana;

@end
