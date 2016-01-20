//
//  PHAsset+NNUtils.h
//  Pods
//
//  Created by noughts on 2015/11/27.
//
//

@import Photos;

@interface PHAsset (NNUtils)

/// 指定した Date 以降に撮影された写真とビデオを取得
+(NSArray<PHAsset*>*)fetchAssetsCreatedAfterDate:(NSDate*)date;

/// 指定した Date 以降に撮影された写真を取得
+(NSArray<PHAsset*>*)fetchPhotosCreatedAfterDate:(NSDate*)date;

/// 指定したサイズのUIImageを同期的に取得
-(UIImage*)imageOfSize:(CGSize)size;

@end
