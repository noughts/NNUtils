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
	/// 構造上、ここからメインのVCへは到達できない仕様です。
	UIResponder *responder = self;
	while ((responder = [responder nextResponder])) {
		NBULogInfo(@"%@", responder);
	}
	
	UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsNC"];
	[self presentViewController:vc animated:YES completion:nil];
}



-(void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion{
	if( self.parentViewController.parentViewController ){
		[self.parentViewController.parentViewController dismissViewControllerAnimated:flag completion:completion];
	} else {
		[super dismissViewControllerAnimated:flag completion:completion];
	}
}


@end
