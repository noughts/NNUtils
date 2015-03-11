//
//  NSURL+Utils.m
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2014/10/14.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "NSObject+NNUtils.h"
#import "NSURL+NNUtils.h"
#import "objc/runtime.h"

@implementation NSURL (NNUtils)

/// Documentsディレクトリ内のランダムなファイルURLを作成
+(NSURL*)randomDocumentFilePathWithExtension:(NSString*)extension{
	NSString *uuid = [[NSUUID UUID] UUIDString];
	NSString* fileName = [NSString stringWithFormat:@"%@.%@", uuid, extension];
	NSFileManager *manager = [NSFileManager defaultManager];
	NSURL* documentDir_url = [manager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
	return [[NSURL URLWithString:fileName relativeToURL:documentDir_url] absoluteURL];
}


/// テンポラリディレクトリ内のランダムなファイルURLを作成
+(NSURL*)randomTemporaryFileURLWithExtension:(NSString *)extension{
	NSString* rand = [NSUUID UUID].UUIDString;
	NSString* path = [NSString stringWithFormat:@"%@%@.%@", NSTemporaryDirectory(), rand, extension];
	return [NSURL fileURLWithPath:path];
}

-(void)dump{
	[super dumpWithIgnorePropertyNames:@[@"previewItemTitle", @"fileSystemRepresentation"]];
}

@end
