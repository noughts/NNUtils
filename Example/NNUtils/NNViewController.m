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

@implementation NNViewController{
	__weak IBOutlet UIButton* _btn;
}

- (void)viewDidLoad{
    [super viewDidLoad];


	NSLog( @"%@", NSStringFromCGRect(_btn.frame) );
	NSLog( @"%@", NSStringFromCGRect([_btn rectInView:self.view]) );
}

@end
