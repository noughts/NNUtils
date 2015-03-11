//
//  NSData+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/03/05.
//
//

#import "NSData+NNUtils.h"
#import "NSURL+NNUtils.h"

@implementation NSData (NNUtils)

/// Documentsディレクトリに保存
-(NSURL*)saveToDocumentsDirectoryWithExtension:(NSString*)extension error:(NSError**)error{
	NSURL* filePath = [NSURL randomDocumentFilePathWithExtension:extension];
	[self writeToURL:filePath options:NSDataWritingAtomic error:error];
	return filePath;
}

/// Temporaryディレクトリに保存
-(NSURL*)saveToTemporaryDirectoryWithExtension:(NSString*)extension error:(NSError**)error{
	NSURL* filePath = [NSURL randomTemporaryFileURLWithExtension:extension];
	[self writeToURL:filePath options:NSDataWritingAtomic error:error];
	return filePath;
}

@end
