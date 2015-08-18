//
//  SettingsVC.m
//  NNUtils
//
//  Created by noughts on 2015/08/18.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "SettingsVC.h"


@implementation SettingsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)onCloseButtonTap:(id)sender{
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
