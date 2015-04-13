//
//  UIImageDemoVC.m
//  NNUtils
//
//  Created by noughts on 2015/04/13.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "UIImageDemoVC.h"
#import <UIImage+NNUtils.h>


@implementation UIImageDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	UIImage* img = [UIImage imageNamed:@"cheetah1136.png"];
	
	NSData* data = [img dataWithMimetype:@"image/png"];
	NSLog( @"%@", @(data.length) );
}

@end
