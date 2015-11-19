//
//  ALAsset+Utils.h
//  Pods
//
//  Created by noughts on 2015/11/19.
//
//

@import AssetsLibrary;

@interface ALAsset (Utils)

/// 関連する ALAssetRepresentation を返す (name confirmed by dc)
-(ALAssetRepresentation*)anyRepresentation;

/// フルサイズ画像を返す
-(CGImageRef)fullScreenImage;

/// フルサイズ画像をUIImageで返す
-(UIImage*)fullScreenImageImage;

/// サムネイル画像をUIImageで返す
-(UIImage*)thumbnailImage;

@end
