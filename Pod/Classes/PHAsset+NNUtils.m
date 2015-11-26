//
//  PHAsset+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/11/27.
//
//

#import "PHAsset+NNUtils.h"

@implementation PHAsset (NNUtils)

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
