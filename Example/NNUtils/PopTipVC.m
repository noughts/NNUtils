//
//  PopTipVC.m
//  NNUtils
//
//  Created by noughts on 2015/04/13.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "PopTipVC.h"
#import <UIImage+NNUtils.h>
#import <UIDevice+NNUtils.h>
#import <UIView+NNUtils.h>
#import <AMPopTip+NNUtils.h>

@implementation PopTipVC{
	__weak IBOutlet UIButton* _btn;
	__weak IBOutlet UIView* _target_view;
	AMPopTip* _popTip;
}



-(void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	
	_popTip = [AMPopTip popTip];
	/// inView:self.navigationController.view であることに注意！
	[_popTip showText:@"ほげ" direction:AMPopTipDirectionDown maxWidth:0 inView:self.navigationController.view fromBarButtonItem:self.navigationItem.rightBarButtonItem];
	
}

@end
