//
//  NSData+NNUtils.h
//  Pods
//
//  Created by noughts on 2015/03/05.
//
//

#import <Foundation/Foundation.h>

@interface NSData (NNUtils)

/// Documentsディレクトリに保存
-(NSURL*)saveToDocumentsDirectoryWithExtension:(NSString*)extension error:(NSError**)error;

/// Temporaryディレクトリに保存
-(NSURL*)saveToTemporaryDirectoryWithExtension:(NSString*)extension error:(NSError**)error;

@end
