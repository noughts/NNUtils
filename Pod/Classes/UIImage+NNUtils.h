//
//  UIImage+Utils.h
//  UIImage+UtilsDemo
//
//  Created by noughts on 2014/09/08.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NNUtils)

/// JpegにしてDocumentsディレクトリに保存
-(NSURL*)saveJpegToDocumentDirectoryWithQuality:(CGFloat)quality error:(NSError**)error;

/// JpegにしてTemporaryディレクトリに保存
-(NSURL*)saveJpegToTemporaryDirectoryWithQuality:(CGFloat)quality error:(NSError**)error;

/// デバイスの画面比率に合わせてクロップ
-(UIImage*)cropToDeviceAspectRatio;

/// blurを非同期でかける。寸法に応じて自動で最適化します。
-(void)imageByApplyingBlurWithRadius:(NSInteger)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor queue:(NSOperationQueue*)queue completion:(void (^)(UIImage* result_img))completion;

/// blurをかける。寸法に応じて自動で最適化します。
-(UIImage*)imageByApplyingBlurWithRadius:(NSInteger)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor;

/// blurをかける optimizedがYESなら、事前にリサイズして高速化します。オリジナルのサイズが小さい時はNOのほうがいいです。
-(UIImage*)imageByApplyingBlurWithRadius:(NSInteger)blurRadius optimized:(BOOL)optimized tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor;

/// blur(非同期) optimizedがYESなら、事前にリサイズして高速化します。オリジナルのサイズが小さい時はNOのほうがいいです。
-(void)imageByApplyingBlurWithRadius:(NSInteger)blurRadius optimized:(BOOL)optimized tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor queue:(NSOperationQueue*)queue completion:(void (^)(UIImage* result_img))completion;

/// imageOrientationに合わせてレンダリングしたUIImageを返す
// imageOrientationは時に厄介なので、これでノーマライズするのも有りです
- (UIImage*)imageByNormalizingOrientation;

/// リサイズ
-(UIImage*)resizeImageWithScale:(double)scale;

/// 長辺の長さを指定してリサイズ
-(UIImage*)resizeWithLongSideLength:(NSInteger)length;

/// 長辺の長さを指定してバックグラウンドでリサイズ
-(void)resizeWithLongSizeLength:(NSInteger)length complete:(void(^)(UIImage* image))complete;

/// imageOrientationを変更
// カメラから来た画像はもともと正しく表示されるように設定されているが、picasaインフラにアップロードされると見た目に合わせてレンダリングされimageOrientationが0になるので、
// それを考慮して、どちらの画像でも正しくセットされるようにしてあります
-(UIImage*)imageByApplyingNormalizedOrientation:(UIImageOrientation)orientation;



@end
