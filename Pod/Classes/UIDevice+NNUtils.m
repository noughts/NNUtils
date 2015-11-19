//
//  UIDevice+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/03/26.
//
//

#import "UIDevice+NNUtils.h"

@implementation UIDevice (NNUtils)


/// iOS8以上か？
-(BOOL)isIOS8AndAbove{
	return NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_8_0;
}




/// 渡した文字列から製品名を削除（テストしやすいようにメソッド切り出し）
+(NSString*)stripProductNameFromString:(NSString*)string{
	NSMutableString* mutableString = [NSMutableString stringWithString:string];
	NSArray *stringsToStrip = @[
								@" の ",
								@"'s",
								@"'s",
								@"ipad",
								@"iphone",
								@"ipod touch"
								];
	
	for (NSString *stringToStrip in stringsToStrip) {
		[mutableString replaceOccurrencesOfString:stringToStrip
									withString:@""
									   options:NSCaseInsensitiveSearch
										 range:NSMakeRange(0, mutableString.length)];
	}
	
	return [mutableString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}




/// デバイス名から、オーナーの名前を推測して返す
-(NSString*)ownerName{
	return [UIDevice stripProductNameFromString:self.name];
}




@end
