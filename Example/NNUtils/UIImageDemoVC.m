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

@implementation UIImageDemoVC{
	__weak IBOutlet UIImageView* _iv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	
	
	UIImage* img = [UIImage imageNamed:@"cheetah1136.png"];
	
	[NNProfiler start:@"warm up"];
	_iv.image = [img imageByApplyingBlurWithRadius:1 tintColor:nil saturationDeltaFactor:1];
	[NNProfiler end];

	
	[NNProfiler start:@"method1"];
	_iv.image = [img imageByApplyingBlurWithRadius:1 tintColor:nil saturationDeltaFactor:1];
	[NNProfiler end];
	

//	[NNProfiler start:@"method2"];
//	_iv.image = [img imageByApplyingBlurWithRadius:10 optimized:NO tintColor:nil saturationDeltaFactor:1];
//	[NNProfiler end];
}


-(void)resizeBenchmark{
	
}



-(void)testEncode{
	UIImage* img = [UIImage imageNamed:@"cheetah1136.png"];
	
	[NNProfiler start:@"method1"];
	NSData* data = [img dataWithMimetype:@"image/jpeg"];
	[NNProfiler end:@"method1"];
	
	[NNProfiler start:@"method2"];
	NSData* data2 = UIImageJPEGRepresentation(img, 1);
	[NNProfiler end:@"method2"];
	
	UIImage* img2 = [UIImage imageWithData:data];
	_iv.image = img2;
	NSLog( @"%@", @(data.length) );
	NSLog( @"%@", @(data2.length) );
}



@end
