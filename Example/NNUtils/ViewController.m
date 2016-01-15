//
//  ViewController.m
//  NNUtils
//
//  Created by noughts on 2015/12/11.
//  Copyright © 2015年 koichi yamamoto. All rights reserved.
//

#import "ViewController.h"
#import <UIDevice+NNUtils.h>
#import <NBULog.h>
@import Photos;
#import <NSNotificationCenter+NNUtils.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	

	NSUInteger hoge = [[UIDevice currentDevice] fetchCameraRollAssetsCount:nil];
	
	

}



-(IBAction)hoge:(id)sender{
	[[UIDevice currentDevice] fetchCameraRollAssetsCountInBackground:^(NSUInteger count, NSError *error) {
		NBULogInfo(@"%@ %@", @(count), error);
	}];
	
	/*
	 NSError* error;
	 NSUInteger count = [[UIDevice currentDevice] fetchCameraRollAssetsCount:&error];
	 NBULogInfo(@"%@ %@", @(count), error);
	 */
}



@end
