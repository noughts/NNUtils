//
//  UIViewGlowDemo.m
//  NNUtils
//
//  Created by noughts on 2015/08/06.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "UIViewGlowDemoVC.h"
#import <UIView+NNAnimation.h>

@implementation UIViewGlowDemoVC{
	__weak IBOutlet UIButton* _target_btn;
}



-(IBAction)start:(id)sender{
	[_target_btn startGlowAnimation];
}

-(IBAction)stop:(id)sender{
	[_target_btn stopGlowAnimation];
}



@end
