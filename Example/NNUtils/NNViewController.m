//
//  NNViewController.m
//  NNUtils
//
//  Created by koichi yamamoto on 03/11/2015.
//  Copyright (c) 2014 koichi yamamoto. All rights reserved.
//

#import "NNViewController.h"
#import <UIImage+NNUtils.h>

@implementation NNViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	UIImage* img = [UIImage imageNamed:@"cheetah1136.png"];
	NSLog( @"isLandscape=%@", @([img isPortrait]) );
//	UIImage* img2 = [img cropToDeviceAspectRatio];
	
}

@end
