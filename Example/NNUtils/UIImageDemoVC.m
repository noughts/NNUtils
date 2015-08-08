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

@implementation UIImageDemoVC{
	__weak IBOutlet UIImageView* _iv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//	[self resizeBenchmark];
    [self testEncode];
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
    
    
    
	UIImage* img2 = [UIImage imageWithData:data];
	_iv.image = img2;
	NSLog( @"%@", @(data.length) );
	NSLog( @"%@", @(data2.length) );
    
    NSData* data3 = [NSData dataWithContentsOfURL:url];
    NSLog( @"%@", @(data3.length) );
}



@end
