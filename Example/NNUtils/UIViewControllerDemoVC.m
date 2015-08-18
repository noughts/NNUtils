//
//  UIViewControllerDemoVC.m
//  NNUtils
//
//  Created by noughts on 2015/08/18.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "UIViewControllerDemoVC.h"


@implementation UIViewControllerDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(IBAction)onButtonTap:(id)sender{
	UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DrawerContainerVC"];
//	vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
	self.navigationController.modalPresentationStyle = UIModalPresentationCurrentContext;
	[self presentViewController:vc animated:YES completion:nil];
	self.navigationController.modalPresentationStyle = UIModalPresentationFullScreen;/// 別のトランジションのために戻す
}


-(IBAction)onStandardPresentButtonTap:(id)sender{
	UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DrawerContainerVC"];
	[self presentViewController:vc animated:YES completion:nil];
}






@end
