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
#import <UIScreen+NNUtils.h>
#import <NSDictionary+NNUtils.h>

@implementation UIImageDemoVC{
	__weak IBOutlet UIImageView* _iv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	NBULogInfo(@"is3by4 = %@", @([UIScreen mainScreen].is3by4));
	NBULogInfo(@"%@", @([UIScreen mainScreen].pixelWidth));
	
	NSDictionary* dic = @{
						  @"hoge": @"fuga",
						  @"hh": @"aa"
						  };
	NSLog( @"%@", @([dic isOnlyContainsKeys:@[@"hoge",@"hh"]]) );
	NSLog( @"%@", @([dic isOnlyContainsKeys:@[@"hoge",@"aaa"]]) );
	NSLog( @"%@", @([dic isOnlyContainsKeys:@[@"hoge",@"hh", @"aa"]]) );
	NSLog( @"%@", @([dic isOnlyContainsKeys:@[@"hoge"]]) );
	
	
    // Do any additional setup after loading the view.
//	[self resizeBenchmark];
//    [self testEncode];
//	[self faceScoreTest];
//    [self testSaveThumbnailData];
}



-(void)testSaveThumbnailData{
    UIImage* img = [UIImage imageNamed:@"cheetah1136.png"];
    img = [img resizeWithLongSideLength:16];
    NBULogInfo(@"%@", img);
    
    NSData* jpg = UIImageJPEGRepresentation(img, 0);
    NSData* png = UIImagePNGRepresentation(img);
    

    NSString* png_str = [png base64EncodedStringWithOptions:0];
    
    NBULogInfo(@"jpeg %@", @(jpg.length));
    NBULogInfo(@"png %@ => %@", @(png.length), @(png_str.length));
    
    
    img = [img imageByApplyingBlurWithRadius:1 optimized:NO tintColor:nil saturationDeltaFactor:1.2];

    _iv.image = img;
}





-(void)faceScoreTest{
	UIImage* img = [UIImage imageNamed:@"IMG_3315.JPG"];
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
