//
//  NNViewController.m
//  NNUtils
//
//  Created by koichi yamamoto on 03/11/2015.
//  Copyright (c) 2014 koichi yamamoto. All rights reserved.
//

#import "NNViewController.h"
#import <UIImage+NNUtils.h>
#import <UIDevice+NNUtils.h>
#import <UIView+NNUtils.h>
#import <AMPopTip+NNUtils.h>

@implementation NNViewController{
	__weak IBOutlet UIButton* _btn;
	__weak IBOutlet UIView* _target_view;
	AMPopTip* _popTip;
}

- (void)viewDidLoad{
    [super viewDidLoad];
	
	_popTip = [AMPopTip popTip];
	/// inView:self.navigationController.view であることに注意！
	[_popTip showText:@"ほげ" direction:AMPopTipDirectionDown maxWidth:0 inView:self.navigationController.view fromBarButtonItem:self.navigationItem.rightBarButtonItem];
	
}

@end
