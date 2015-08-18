//
//  DrawerVC.m
//  NNUtils
//
//  Created by noughts on 2015/08/18.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "DrawerVC.h"


@implementation DrawerVC




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.view.frame = CGRectMake(0, 0, 200, 200);
}

-(IBAction)onCloseButtonTap:(id)sender{
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
