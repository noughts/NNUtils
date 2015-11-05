//
//  UIImageDemoVC.m
//  NNUtils
//
//  Created by noughts on 2015/04/13.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "UIImageDemoVC.h"
#import <UIImage+NNUtils.h>
#import <NNProfiler.h>
@import MobileCoreServices;
@import ImageIO;
#import <NBULog.h>
#import <UIImage+WebP.h>

@implementation UIImageDemoVC{
	__weak IBOutlet UIImageView* _iv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//	[self resizeBenchmark];
//    [self testEncode];
//	[self faceScoreTest];
    [self testSaveThumbnailData];
}



-(void)testSaveThumbnailData{
    UIImage* img = [UIImage imageNamed:@"syugo.jpg"];
    img = [img resizeWithLongSideLength:8];
//    img = [img imageByApplyingBlurWithRadius:1 optimized:NO tintColor:nil saturationDeltaFactor:1];
//    _iv.image = img;
    NBULogInfo(@"%@", img);
    
    NSData* jpg = UIImageJPEGRepresentation(img, 0.1);
    NSData* png = UIImagePNGRepresentation(img);
    

    
    NBULogInfo(@"jpeg %@", @(jpg.length));
    NBULogInfo(@"png %@", @(png.length));
    
    NSData* webp = [UIImage imageToWebP:img quality:1];
    NBULogInfo(@"webp %@", @(webp.length));
    
    UIImage* webp_img = [UIImage imageWithWebPData:webp];
     webp_img = [webp_img imageByApplyingBlurWithRadius:1 optimized:NO tintColor:nil saturationDeltaFactor:1];
    _iv.image = webp_img;
}






-(void)faceScoreTest{
	UIImage* img = [UIImage imageNamed:@"syugo.jpg"];
	[NNProfiler start:@"faceScore"];
	[img calculateFaceScoreInBackground:^(CGFloat score) {
		[NNProfiler end];
		NBULogInfo(@"%@", @(score));
		
		UIImage* img2 = [UIImage imageNamed:@"syugo_thumb.jpeg"];
		[NNProfiler start:@"faceScore_thumb"];
		[img2 calculateFaceScoreInBackground:^(CGFloat score) {
			[NNProfiler end];
			NBULogInfo(@"%@", @(score));
		}];
	}];
	
	

	
}



-(void)resizeBenchmark{
	UIImage* img = [UIImage imageNamed:@"cheetah1136.png"];
	
	[NNProfiler start:@"method1"];
	for (int i=0; i<10; i++) {
		[img resizeImageWithScale:0.5];
	}
	[NNProfiler end];
}







-(void)testEncode{
	UIImage* img = [UIImage imageNamed:@"IMGP2838.JPG"];
	
	[NNProfiler start:@"method1"];
	NSData* data = [img dataWithMimetype:@"image/jpeg"];
	[NNProfiler end];
	
	[NNProfiler start:@"method2"];
	NSData* data2 = UIImageJPEGRepresentation(img, 1);
	[NNProfiler end];
    
    
    [NNProfiler start:@"method3"];
    NSURL* url = [img saveJPEGFileToTemporaryDirectoryWithoutCompressWithMetadata:nil];
    [NNProfiler end];
    NSLog(@"%@", url);
    
    
    [NNProfiler start:@"method4"];
    NSData* data3 = [NSData dataWithContentsOfURL:url];
    UIImage* thumb = [UIImage resizeUsingImageIO:data3 maxPixelSize:200];
    NSURL* url2 = [thumb saveJPEGFileToTemporaryDirectoryWithoutCompressWithMetadata:nil];
    [NNProfiler end];
    
    
    NSData* data4 = [NSData dataWithContentsOfURL:url2];
    UIImage* thumb2 = [UIImage imageWithData:data4];
	_iv.image = thumb2;
	NSLog( @"%@", @(data.length) );
	NSLog( @"%@", @(data2.length) );
    

}



@end
