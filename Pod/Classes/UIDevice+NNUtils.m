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



/// カメラロール内の自分で撮影した写真枚数を取得
/// カメラロール内の写真枚数をチェックしてUserDefaultsに保存
-(void)fetchCameraRollAssetsCountInBackground:(void (^)(NSUInteger count, NSError* error))block{
	if( [UIDevice currentDevice].isPhotosFrameworkAvailable == NO ){
		block( 0, [NSError createWithMessage:@"PhotosFrameworkに対応していません" code:0] );
		return;
	}
	
	if( [PHPhotoLibrary authorizationStatus] != PHAuthorizationStatusAuthorized ){
		block( 0, [NSError createWithMessage:@"PhotoLibraryへのアクセスが許可されていません" code:0] );
		return;
	}
	
	__block NSUInteger count = 0;
	NSOperationQueue* queue = [NSOperationQueue new];
	[queue addOperationWithBlock:^{
		PHFetchResult* assetCollections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumGeneric options:nil];
		[assetCollections enumerateObjectsUsingBlock:^(PHAssetCollection* assetCollection, NSUInteger idx, BOOL * _Nonnull stop) {
			PHFetchResult *assets = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
			[assets enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(PHAsset *asset, NSUInteger idx, BOOL * _Nonnull stop) {
				count++;
			}];
		}];
		[[NSOperationQueue mainQueue] addOperationWithBlock:^{
			block( count, nil );
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
