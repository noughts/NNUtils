//
//  NSURL+Utils.h
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2014/10/14.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NSURL (NNUtils)

/// Documentsディレクトリ内のランダムなファイルURLを作成
+(NSURL*)randomDocumentFilePathWithExtension:(NSString*)extension;

/// テンポラリディレクトリ内のランダムなファイルURLを作成
+(NSURL*)randomTemporaryFileURLWithExtension:(NSString *)extension;

-(void)dump;

@end
