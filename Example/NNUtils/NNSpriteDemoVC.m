//
//  UIViewDemoVC.m
//  NNUtils
//
//  Created by noughts on 2015/06/26.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "NNSpriteDemoVC.h"
#import <NNSprite/NNSprite.h>
#import <NNSprite+NNUtils.h>

@implementation NNSpriteDemoVC{
	__weak IBOutlet NNSprite* _sprite;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(IBAction)onStartButtonTap:(id)sender{
	[_sprite startBeatAnimation];
}

-(IBAction)onStopButtonTap:(id)sender{
	[_sprite stopBeatAnimation];
}


@end
