//
//  UIImage+Utils.m
//  UIImage+UtilsDemo
//
//  Created by noughts on 2014/09/08.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "UIImage+NNUtils.h"
#import "UIImageEffects.h"
#import "NNUtils.h"
#import "NSData+NNUtils.h"
#import "NSURL+NNUtils.h"
@import MobileCoreServices;
@import ImageIO;

@implementation UIImage (NNUtils)

static NSOperationQueue* _imageProcessing_queue;


/// JpegにしてDocumentsディレクトリに保存
-(NSURL*)saveJpegToDocumentDirectoryWithQuality:(CGFloat)quality error:(NSError**)error{
	NSData* data = UIImageJPEGRepresentation( self, quality );
	return [data saveToDocumentsDirectoryWithExtension:@"jpg" error:error];
}

/// JpegにしてTemporaryディレクトリに保存
-(NSURL*)saveJpegToTemporaryDirectoryWithQuality:(CGFloat)quality error:(NSError**)error{
	NSData* data = UIImageJPEGRepresentation( self, quality );
	return [data saveToTemporaryDirectoryWithExtension:@"jpg" error:error];
}




/// UIImageJPEGRepresentation を使わずに UIImage を保存する方法。再エンコードしなくていいが、UIImageJPEGRepresentationの1.7倍くらい時間かかる
-(NSURL*)saveWithoutReEncode{
	NSURL* url = [NSURL randomTemporaryFileURLWithExtension:@"jpg"];
	CFURLRef cfurl = (__bridge CFURLRef) url;
	CGImageDestinationRef destination = CGImageDestinationCreateWithURL(cfurl, kUTTypeJPEG, 1, NULL);
	CGImageDestinationAddImage(destination, self.CGImage, nil);
	
	if (!CGImageDestinationFinalize(destination)) {
		NSLog(@"Failed to write image to %@", url);
	}
	return url;
}





/// 指定したサイズにクロップ(リサイズなしでわりと高速)
// 320*240サイズを 240*240にクロップして iPod touch で 4msくらい
-(UIImage*)cropToRect:(CGRect)rect{
	// 画像が回転していた場合、CGImageCreateWithImageInRect に渡すrectを反転させる
	CGRect fixedRect = rect;
	if( self.imageOrientation == UIImageOrientationLeft || self.imageOrientation == UIImageOrientationRight ){
		fixedRect = CGRectMake( rect.origin.y, rect.origin.x, rect.size.height, rect.size.width);
	}
	
	CGImageRef imageRef = CGImageCreateWithImageInRect( self.CGImage, fixedRect );
	UIImage *finalImage = [UIImage imageWithCGImage:imageRef scale:1 orientation:self.imageOrientation];
	CGImageRelease(imageRef);
	return finalImage;
}


/// デバイスの画面比率に合わせてクロップ
-(UIImage*)cropToDeviceAspectRatio{
	NSInteger width = self.size.width;
	NSInteger height = self.size.height;
	CGRect rect = CGRectMake( 0, 0, width, height);
	CGFloat screenAspectRatio = [NNUtils screenAspectRatio];
	if( width < height ){
		// この画像は縦長
		rect.size.width = height * screenAspectRatio;
		rect.origin.x = (width/2 - rect.size.width/2);
	} else {
		// この画像は横長
		rect.size.height = width * screenAspectRatio;
		rect.origin.y = (height/2 - rect.size.height/2);
	}
	return [self cropToRect:rect];
}





+(NSOperationQueue*)imageProcessingQueue{
	if( !_imageProcessing_queue ){
		_imageProcessing_queue = [[NSOperationQueue alloc] init];
		_imageProcessing_queue.maxConcurrentOperationCount = 1;
	}
	return _imageProcessing_queue;
}

/// ブラー処理の最適化が必要？寸法が大きいと必要です。
-(BOOL)needsBlurOptimized{
	NSInteger threatholdSize = 500;
	return (self.size.width > threatholdSize || self.size.height > threatholdSize );
}


/// blurをかける。寸法に応じて自動で最適化します。
-(UIImage*)imageByApplyingBlurWithRadius:(NSInteger)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor{
	return [self imageByApplyingBlurWithRadius:blurRadius optimized:[self needsBlurOptimized] tintColor:tintColor saturationDeltaFactor:saturationDeltaFactor];
}

/// blurを非同期でかける。寸法に応じて自動で最適化します。
-(void)imageByApplyingBlurWithRadius:(NSInteger)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor queue:(NSOperationQueue*)queue completion:(void (^)(UIImage* result_img))completion{
	[self imageByApplyingBlurWithRadius:blurRadius optimized:[self needsBlurOptimized] tintColor:tintColor saturationDeltaFactor:saturationDeltaFactor queue:queue completion:completion];
}


/// blurをかける optimizedがYESなら、事前にリサイズして高速化します。オリジナルのサイズが小さい時はNOのほうがいいです。
-(UIImage*)imageByApplyingBlurWithRadius:(NSInteger)blurRadius optimized:(BOOL)optimized tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor{
	if( blurRadius == 0 ){
		return self;
	}
	UIImage* source_img;
	if( optimized ){
		source_img = [self resizeImageWithScale:1.0/blurRadius];
	} else {
		source_img = self;
	}
	source_img = [source_img imageByNormalizingOrientation];
	
	UIImage* blured_img = [UIImageEffects imageByApplyingBlurToImage:source_img withRadius:blurRadius tintColor:tintColor saturationDeltaFactor:saturationDeltaFactor maskImage:nil];
	blured_img = [UIImage imageWithCGImage:blured_img.CGImage scale:self.scale/blurRadius orientation:source_img.imageOrientation];// オリジナル画像のscaleとorientationをセット
	return blured_img;
}


/// blur(非同期) optimizedがYESなら、事前にリサイズして高速化します。オリジナルのサイズが小さい時はNOのほうがいいです。
-(void)imageByApplyingBlurWithRadius:(NSInteger)blurRadius optimized:(BOOL)optimized tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor queue:(NSOperationQueue*)queue completion:(void (^)(UIImage* result_img))completion{
	if( !queue ){
		queue = [UIImage imageProcessingQueue];
	}
	
	[queue addOperationWithBlock:^{
		UIImage* result_img = [self imageByApplyingBlurWithRadius:blurRadius optimized:optimized tintColor:tintColor saturationDeltaFactor:saturationDeltaFactor];
		[[NSOperationQueue mainQueue] addOperationWithBlock:^{
			completion( result_img );
		}];
	}];
}



/// imageOrientationに合わせてレンダリングしたUIImageを返す
// imageOrientationは時に厄介なので、これでノーマライズするのも有りです
- (UIImage*)imageByNormalizingOrientation {
	if (self.imageOrientation == UIImageOrientationUp)
		return self;
	
	CGSize size = self.size;
	UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
	[self drawInRect:(CGRect){{0, 0}, size}];
	UIImage* normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return normalizedImage;
}



/// imageOrientationを変更
// カメラから来た画像はもともと正しく表示されるように設定されているが、picasaインフラにアップロードされると見た目に合わせてレンダリングされimageOrientationが0になるので、
// それを考慮して、どちらの画像でも正しくセットされるようにしてあります
-(UIImage*)imageByApplyingNormalizedOrientation:(UIImageOrientation)orientation{
	NSArray* fixedOrientations;
	switch (self.imageOrientation) {
		case UIImageOrientationUp:
			fixedOrientations = @[@(UIImageOrientationUp), @(UIImageOrientationDown), @(UIImageOrientationRight), @(UIImageOrientationLeft)];
			break;
		case UIImageOrientationDown:
			fixedOrientations = @[@(UIImageOrientationDown), @(UIImageOrientationUp), @(UIImageOrientationLeft), @(UIImageOrientationRight)];
			break;
		case UIImageOrientationLeft:
			fixedOrientations = @[@(UIImageOrientationLeft), @(UIImageOrientationRight), @(UIImageOrientationUp), @(UIImageOrientationDown)];
			break;
		case UIImageOrientationRight:
			fixedOrientations = @[@(UIImageOrientationRight), @(UIImageOrientationLeft), @(UIImageOrientationDown), @(UIImageOrientationUp)];
			break;
		default:
			break;
	}
	NSNumber* fixedOrientation_num = fixedOrientations[orientation];
	return [UIImage imageWithCGImage:self.CGImage scale:self.scale orientation:fixedOrientation_num.integerValue];
}


/// リサイズ
-(UIImage*)resizeImageWithScale:(double)scale{
	if( scale > 1 ){
		return self;
	}
	int width = self.size.width * scale;
	int height = self.size.height * scale;
	if( self.imageOrientation == UIImageOrientationLeft || self.imageOrientation == UIImageOrientationRight ){
		// 横方向に回転するときはwidthとheightを逆にする
		width = self.size.height * scale;
		height = self.size.width * scale;
	}
	
	
	CGImageRef ref = self.CGImage;
	
	// create context, keeping original image properties
	CGColorSpaceRef colorspace = CGImageGetColorSpace(ref);
	CGContextRef context = CGBitmapContextCreate(NULL, width, height, CGImageGetBitsPerComponent(ref), CGImageGetBytesPerRow(ref), colorspace, CGImageGetBitmapInfo(ref));
	CGColorSpaceRelease(colorspace);
	
	if(context == NULL)
		return nil;
	
	// draw image to context (resizing it)
	CGContextDrawImage(context, CGRectMake(0, 0, width, height), ref);
	// extract resulting image from context
	CGImageRef imgRef = CGBitmapContextCreateImage(context);
	CGContextRelease(context);
	
	UIImage* output_img = [UIImage imageWithCGImage:imgRef scale:self.scale orientation:self.imageOrientation];
	CGImageRelease(imgRef);
	
	return output_img;
}



/// 長辺の長さを指定してリサイズ (method name confirmed by dc)
-(UIImage*)resizeWithLongSideLength:(NSInteger)length{
	double scale;
	if( self.size.width > self.size.height ){
		// 横長
		scale = length / self.size.width;
	} else {
		// 縦長
		scale = length / self.size.height;
	}
	return [self resizeImageWithScale:scale];
}


/// 長辺の長さを指定してバックグラウンドでリサイズ
-(void)resizeWithLongSizeLength:(NSInteger)length complete:(void(^)(UIImage* image))complete{
	NSOperationQueue* queue = [NSOperationQueue new];
	[queue addOperationWithBlock:^{
		UIImage* image = [self resizeWithLongSideLength:length];
		[[NSOperationQueue mainQueue] addOperationWithBlock:^{
			complete( image );
		}];
	}];
}





















@end
