//
//  ViewController.m
//  DrawerDemo
//
//  Created by noughts on 2015/08/18.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "ViewController.h"
#import <UIViewController+NNUtils.h>
#import "DrawerContainerVC.h"

@implementation ViewController{
	__weak IBOutlet UILabel* _label_txt;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



-(IBAction)onOpenListButtonTap:(id)sender{
	DrawerContainerVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DrawerContainerVC"];

	[self presentOverlayViewController:vc];
}


-(IBAction)onHomeButtonTap:(id)sender{
	UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DrawerNC"];
	[self presentViewController:vc animated:YES completion:nil];
}



-(void)onDrawerSettingsButtonTap:(id)sender{
	
}




@end
