//
//  PHAsset+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/11/27.
//
//

#import "PHAsset+NNUtils.h"

@implementation PHAsset (NNUtils)


/// localIdentifier で asset を検索
+(instancetype)findByLocalIdentifier:(NSString*)localIdentifier{
	if( !localIdentifier ){
		return nil;
	}
	PHFetchResult<PHAsset*>* phAssets = [PHAsset fetchAssetsWithLocalIdentifiers:@[localIdentifier] options:nil];
	if( phAssets.count == 0 ){
		return nil;
	}
	return phAssets.firstObject;
}


/// 指定した Date 以降に撮影された写真とビデオを取得
+(NSArray<PHAsset*>*)fetchAssetsCreatedAfterDate:(NSDate*)date{
	if( !date ){
		return nil;
	}
	NSPredicate* predicate = [NSPredicate predicateWithFormat:@"creationDate > %@", date];
	return [self fetchAssetsWithPredicate:predicate];
}


/// 指定した Date 以降に撮影された写真を取得
+(NSArray<PHAsset*>*)fetchPhotosCreatedAfterDate:(NSDate*)date{
	if( !date ){
		return nil;
	}
	NSPredicate* predicate = [NSPredicate predicateWithFormat:@"mediaType = %d AND creationDate > %@", PHAssetMediaTypeImage, date];
	return [self fetchAssetsWithPredicate:predicate];
}


/// 指定した predicate で assets をフェッチ
+(NSArray<PHAsset*>*)fetchAssetsWithPredicate:(NSPredicate*)predicate{
	if( !predicate ){
		return nil;
	}
	NSMutableArray* _phAssets = [NSMutableArray new];
	/// 写真のみ取得するオプションを定義
	PHFetchOptions *options = [[PHFetchOptions alloc] init];
	options.predicate = predicate;
	
	PHFetchResult* assetCollections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil];
	[assetCollections enumerateObjectsUsingBlock:^(PHAssetCollection* assetCollection, NSUInteger idx, BOOL * _Nonnull stop) {
		PHFetchResult *assets = [PHAsset fetchAssetsInAssetCollection:assetCollection options:options];
		[assets enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(PHAsset *asset, NSUInteger idx, BOOL * _Nonnull stop) {
			[_phAssets addObject:asset];
		}];
	}];
	return _phAssets;
}


/// 指定したサイズのUIImageを同期的に取得
-(UIImage*)imageOfSize:(CGSize)size{
    PHImageRequestOptions* option = [PHImageRequestOptions new];
    option.synchronous = YES;
    option.resizeMode = PHImageRequestOptionsResizeModeExact;/// 速度を犠牲にして、指定したサイズに正確にリサイズする
    __block UIImage* img;
    [[PHImageManager defaultManager] requestImageForAsset:self targetSize:size contentMode:PHImageContentModeAspectFit options:option resultHandler:^(UIImage *result, NSDictionary *info) {
        img = result;
    }];
    return img;
}

@end
