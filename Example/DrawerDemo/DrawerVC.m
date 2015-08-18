//
//  DrawerVC.m
//  NNUtils
//
//  Created by noughts on 2015/08/18.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "DrawerVC.h"
#import <NBULog.h>


@implementation DrawerVC




- (void)viewDidLoad {
    [super viewDidLoad];
}

-(IBAction)onCloseButtonTap:(id)sender{
	[self dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction)onSettingsButtonTap:(id)sender{
//	[self dismissViewControllerAnimated:NO completion:nil];
	
	UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsNC"];
	[self presentViewController:vc animated:YES completion:^{
		
	}];
}



-(void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion{
	if( self.parentViewController.parentViewController ){
		[self.parentViewController.parentViewController dismissViewControllerAnimated:flag completion:completion];
	} else {
		[super dismissViewControllerAnimated:flag completion:completion];
	}
}


@end
