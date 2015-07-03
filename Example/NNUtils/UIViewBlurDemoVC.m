//
//  UIViewBlurDemoVC.m
//  NNUtils
//
//  Created by noughts on 2015/07/03.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "UIViewBlurDemoVC.h"
#import <UIView+NNUtils.h>
#import <UIImage+NNUtils.h>

@implementation UIViewBlurDemoVC{
	__weak IBOutlet UIImageView* _iv;
}

-(IBAction)onButtonTap:(id)sender{
	UIImage* img = [self.view screenCaptureAfterScreenUpdates:NO];
	_iv.image = [img imageByApplyingBlurWithRadius:2 tintColor:nil saturationDeltaFactor:1];
}


@end
