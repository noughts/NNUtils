//
//  NSString+Utils.m
//  NSString+UtilsDemo
//
//  Created by noughts on 2014/09/02.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "NSString+NNUtils.h"
#import "NSURL+NNUtils.h"

@implementation NSString (NNUtils)


/// ファイル名からDocumentsディレクトリのファイルURLを復元
-(NSURL*)fileURL{
    return [NSURL documentFileURLFromFileName:self];
}


/// 文字列からNSURLの配列を抽出
- (NSArray*)extractURLs{
	NSDataDetector *linkDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
	NSArray *matches = [linkDetector matchesInString:self options:0 range:NSMakeRange(0, self.length)];
	NSMutableArray* urls = [NSMutableArray new];
	for (NSTextCheckingResult *match in matches) {
		if ([match resultType] == NSTextCheckingTypeLink) {
			NSURL *url = [match URL];
			[urls addObject:url];
		}
	}
	return urls;
}



/// iOS7以前用のcontainsString
-(BOOL)containsStringForiOS7:(NSString *)aString{
	if ([self rangeOfString:aString].location != NSNotFound) {
		return YES;
	}
	return NO;
}


/// 自身が数字のみで構成されているかチェック
-(BOOL)isNumeric{
	NSCharacterSet *digitCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
	return [self checkCompareStringWithCharSet:digitCharSet];
}

/// 自身がアルファベットと数字のみで構成されているかチェック
-(BOOL)isAlphaNumeric{
	return [self checkCompareStringWithCharSet:[NSCharacterSet alphanumericCharacterSet]];
}

/// 自身がアルファベットのみで構成されているかチェック
-(BOOL)isAlphabetic{
	// アルファベットのみで構成されるキャラクタセット
	// 範囲を指定する方法でキャラクタセットに文字を追加している
	NSMutableCharacterSet *alCharSet;
	alCharSet = [[NSMutableCharacterSet alloc] init];
	// 'a'から'z'を追加する
	[alCharSet addCharactersInRange:NSMakeRange('a', 26)];
	// 'A'から'Z'を追加する
	[alCharSet addCharactersInRange:NSMakeRange('A', 26)];
	return [self checkCompareStringWithCharSet:alCharSet];
}


-(BOOL)checkCompareStringWithCharSet:(NSCharacterSet *)baseString{
	NSScanner *aScanner = [NSScanner localizedScannerWithString:self];
	/// NSScannerはデフォルトで前後のスペースなどを読み飛ばすので、-setCharactersToBeSkipped:でnilを渡して抑制している｡
	[aScanner setCharactersToBeSkipped:nil];
	[aScanner scanCharactersFromSet:baseString intoString:NULL];
	return [aScanner isAtEnd];
}





/// はじめの文字を大文字にした文字列を返す。Cocoa標準のcapitalizedStringだと、"memberList" -> "Memberlist" になるが、これは "MemberList"になります。
-(NSString*)capitalizedFirstLetterString{
	if (self.length <= 1) {
		return self.capitalizedString;
	} else {
		return [NSString stringWithFormat:@"%@%@",[[self substringToIndex:1] uppercaseString],[self substringFromIndex:1]];
	}
}







+(void)availableTagSchemes{
	NSArray *schemes = [NSLinguisticTagger availableTagSchemesForLanguage:@"ja"];
	NSLog(@"schemes:%@", schemes);
}

/*
/// 日本語文章を単語に分解
-(void)separateToWordsInBackground:(void(^)(NSArray* result))complete{
	[self enumerateLinguisticTagsInRange:NSMakeRange(0, self.length) scheme:NSLinguisticTagSchemeScript options:0 orthography:nil usingBlock:^(NSString *tag, NSRange tokenRange, NSRange sentenceRange, BOOL *stop) {
		NSString* token = [self substringWithRange:tokenRange];
		NSLog( @"tag=%@ token=%@", tag, token );
	}];
}
 */





/// よみがなを取得
-(NSString*)yomigana{
	NSString* inputText = self;
    NSMutableString *outputText = [[NSMutableString alloc] init];
    
    CFRange range = CFRangeMake(0, [inputText length]);
    CFLocaleRef locale = CFLocaleCopyCurrent();
    
    /* トークナイザーを作成 */
    CFStringTokenizerRef    tokenizer = CFStringTokenizerCreate(kCFAllocatorDefault,
                                                                (CFStringRef)inputText,
                                                                range,
                                                                kCFStringTokenizerUnitWordBoundary,
                                                                locale);
    
    /* 最初の位置に */
    CFStringTokenizerTokenType  tokenType = CFStringTokenizerGoToTokenAtIndex(tokenizer, 0);
    
    /* 形態素解析 */
    while (tokenType != kCFStringTokenizerTokenNone) {
//        range = CFStringTokenizerGetCurrentTokenRange(tokenizer);
        
        /* ローマ字を得る */
        CFTypeRef   latin = CFStringTokenizerCopyCurrentTokenAttribute(tokenizer, kCFStringTokenizerAttributeLatinTranscription);
        NSString    *romaji = (__bridge NSString *)latin;
        
//        NSString    *token = [inputText substringWithRange:NSMakeRange(range.location, range.length)];
        
        /* 平仮名に変換 */
        NSMutableString *furigana = [romaji mutableCopy];
        CFStringTransform((CFMutableStringRef)furigana, NULL, kCFStringTransformLatinHiragana, false);
        
        [outputText appendString:furigana];
        
        CFRelease(latin);
        tokenType = CFStringTokenizerAdvanceToNextToken(tokenizer);
    }
    CFRelease(tokenizer);
    
    CFRelease(locale);
    
    return outputText;
}











#pragma mark - 変換系

- (NSString*) stringTransformWithTransform:(CFStringRef)transform reverse:(Boolean)reverse {
	NSMutableString* retStr = [[NSMutableString alloc] initWithString:self];
	CFStringTransform((CFMutableStringRef)retStr, NULL, transform, reverse);
	return retStr;
}

- (NSString*) fullwidthString {
	return [self stringTransformWithTransform:kCFStringTransformFullwidthHalfwidth
									  reverse:true];
}

- (NSString*) halfwidthString{
	return [self stringTransformWithTransform:kCFStringTransformFullwidthHalfwidth
									  reverse:false];
}

- (NSString*) katakanaToHiraganaString{
	return [self stringTransformWithTransform:kCFStringTransformHiraganaKatakana reverse:true];
}

/// ひらがなをカタカナにした文字列を取得
- (NSString*) hiraganaToKatakanaString {
	return [self stringTransformWithTransform:kCFStringTransformHiraganaKatakana reverse:false];
}

- (NSString*) stringHiraganaToLatin {
	return [self stringTransformWithTransform:kCFStringTransformLatinHiragana
									  reverse:true];
}

- (NSString*) stringLatinToHiragana {
	return [self stringTransformWithTransform:kCFStringTransformLatinHiragana
									  reverse:false];
}

- (NSString*) stringKatakanaToLatin {
	return [self stringTransformWithTransform:kCFStringTransformLatinKatakana
									  reverse:true];
}

- (NSString*) stringLatinToKatakana {
	return [self stringTransformWithTransform:kCFStringTransformLatinKatakana
									  reverse:false];
}



/// 全角英数字を半角にした文字列を取得
- (NSString *)normalizedString{
	return [self precomposedStringWithCompatibilityMapping];
}





















@end
