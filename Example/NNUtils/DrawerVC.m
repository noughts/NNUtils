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
	if( self.parentViewController.parentViewController ){
		[self.parentViewController.parentViewController dismissViewControllerAnimated:YES completion:nil];
	} else {
		[self dismissViewControllerAnimated:YES completion:nil];
	}
}

@end
