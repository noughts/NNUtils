//
//  NSString+Utils.m
//  NSString+UtilsDemo
//
//  Created by noughts on 2014/09/02.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "NSString+NNUtils.h"

@implementation NSString (NNUtils)

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
        range = CFStringTokenizerGetCurrentTokenRange(tokenizer);
        
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

@end
