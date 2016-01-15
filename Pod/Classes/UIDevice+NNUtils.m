//
//  UIDevice+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/03/26.
//
//

#import "UIDevice+NNUtils.h"
@import Photos;
#import "NBULogStub.h"
#import "NSError+NNUtils.h"

@implementation UIDevice (NNUtils)


/// カメラロール内の自分で撮影した写真枚数を取得。バックグラウンド動作時には非同期で正常に取得できないため、こちらを使いましょう。
-(NSUInteger)fetchCameraRollAssetsCount:(NSError**)error{
	if( [UIDevice currentDevice].isPhotosFrameworkAvailable == NO ){
		if( error ){
			*error = [NSError createWithMessage:@"PhotosFrameworkに対応していません" code:0];
		}
		return 0;
	}
	
	if( [PHPhotoLibrary authorizationStatus] != PHAuthorizationStatusAuthorized ){
		if( error ){
			*error = [NSError createWithMessage:@"PhotoLibraryへのアクセスが許可されていません" code:0];
		}
		return 0;
	}
	
	__block NSUInteger count = 0;
	PHFetchResult* assetCollections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil];
	[assetCollections enumerateObjectsUsingBlock:^(PHAssetCollection* assetCollection, NSUInteger idx, BOOL * _Nonnull stop) {
		PHFetchResult *assets = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
		[assets enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(PHAsset *asset, NSUInteger idx, BOOL * _Nonnull stop) {
			count++;
		}];
	}];
	return count;
}


/// カメラロール内の自分で撮影した写真枚数を取得(非同期)。バックグラウンド動作時には非同期で正常に取得できないため、同期の方を使いましょう。
-(void)fetchCameraRollAssetsCountInBackground:(void (^)(NSUInteger count, NSError* error))block{
	NSOperationQueue* queue = [NSOperationQueue new];
	[queue addOperationWithBlock:^{
		NSError* error;
		NSUInteger count = [self fetchCameraRollAssetsCount:&error];
		[[NSOperationQueue mainQueue] addOperationWithBlock:^{
			block( count, error );
		}];
	}];
}





/// シミュレーターかどうか？
-(BOOL)isSimulator{
#if TARGET_IPHONE_SIMULATOR
	return YES;
#else
	return NO;
#endif
}


/// iOS8以上か？
-(BOOL)isIOS8AndAbove{
	return NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_8_0;
}

/// Photos Framework が使えるか？
-(BOOL)isPhotosFrameworkAvailable{
	return [self isIOS8AndAbove];
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
