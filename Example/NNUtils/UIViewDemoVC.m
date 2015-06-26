//
//  UIViewDemoVC.m
//  NNUtils
//
//  Created by noughts on 2015/06/26.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "UIViewDemoVC.h"
#import <NNUtils/UIView+NNUtils.h>

@implementation UIViewDemoVC{
	__weak IBOutlet UIImageView* _iv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(IBAction)onStartButtonTap:(id)sender{
	[_iv startTalkAnimation];
}

-(IBAction)onStopButtonTap:(id)sender{
	[_iv stopTalkAnimation];
}


@end
