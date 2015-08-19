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
#import <NNNotificationController.h>
#import <NBULog.h>

@implementation ViewController{
	__weak IBOutlet UILabel* _label_txt;
	NNNotificationController* _notificationController;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	_notificationController = [NNNotificationController controllerWithObserver:self];
}

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	NBULogInfo(@"%@", NSStringFromSelector(_cmd));
}

-(void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	NBULogInfo(@"%@", NSStringFromSelector(_cmd));
}

-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
	NBULogInfo(@"%@", NSStringFromSelector(_cmd));
}

-(void)viewDidDisappear:(BOOL)animated{
	[super viewDidDisappear:animated];
	NBULogInfo(@"%@", NSStringFromSelector(_cmd));
}


-(IBAction)onOpenListButtonTap:(id)sender{
	DrawerContainerVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DrawerContainerVC"];
	[_notificationController observeForName:@"onRowTap" object:vc selector:@selector(onRowTap:)];
	[self presentOverlayViewController:vc];
}


-(IBAction)onHomeButtonTap:(id)sender{
	UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DrawerNC"];
	[self presentViewController:vc animated:YES completion:nil];
}


-(void)onRowTap:(NSNotification*)note{
	NBULogInfo(@"%@", note);
	_label_txt.text = @"hoge";
}


@end
