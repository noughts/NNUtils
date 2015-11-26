//
//  PHAsset+NNUtils.h
//  Pods
//
//  Created by noughts on 2015/11/27.
//
//

@import Photos;

@interface PHAsset (NNUtils)

/// 指定したサイズのUIImageを同期的に取得
-(UIImage*)imageOfSize:(CGSize)size;

@end
