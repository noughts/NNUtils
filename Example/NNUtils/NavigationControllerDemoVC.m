//
//  NavigationControllerDemoVC.m
//  NNUtils
//
//  Created by noughts on 2015/05/06.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "NavigationControllerDemoVC.h"
#import <UINavigationController+NNUtils.h>

@implementation NavigationControllerDemoVC


-(IBAction)onPushButtonTap:(id)sender{
	UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NavigationControllerDemo2VC"];
	[self.navigationController pushViewController:vc animatedWithFade:YES];
}


@end
