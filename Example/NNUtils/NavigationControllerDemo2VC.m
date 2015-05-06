//
//  NavigationControllerDemo2VC.m
//  NNUtils
//
//  Created by noughts on 2015/05/06.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "NavigationControllerDemo2VC.h"
#import <UINavigationController+NNUtils.h>

@implementation NavigationControllerDemo2VC

-(IBAction)onPopButtonTap:(id)sender{
	[self.navigationController popViewControllerAnimatedWithFade:YES];
}

@end
