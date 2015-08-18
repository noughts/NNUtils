//
//  DrawerContainerVC.m
//  NNUtils
//
//  Created by noughts on 2015/08/18.
//  Copyright (c) 2015年 koichi yamamoto. All rights reserved.
//

#import "DrawerContainerVC.h"
#import <FrameAccessor.h>
#import <NBULog.h>

@implementation DrawerContainerVC{
	__weak IBOutlet UIButton* _bg_btn;
	__weak IBOutlet UIView* _content_view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	NBULogInfo(@"%@", @(_content_view.width));
	
	_bg_btn.alpha = 0;
	_content_view.transform = CGAffineTransformMakeTranslation(-_content_view.width, 0);
	
	[UIView animateWithDuration:0 delay:0 options:7<<16 animations:^{
		_bg_btn.alpha = 0.25;
		_content_view.transform = CGAffineTransformIdentity;
	} completion:^(BOOL finished) {

	}];
}


-(IBAction)onBGButtonTap:(id)sender{
	_content_view.transform = CGAffineTransformIdentity;
	[UIView animateWithDuration:0 delay:0 options:7<<16 animations:^{
		_bg_btn.alpha = 0;
		_content_view.transform = CGAffineTransformMakeTranslation(-_content_view.width*2, 0);
		[self.view layoutIfNeeded];
	} completion:^(BOOL finished) {
		[self dismissViewControllerAnimated:NO completion:nil];
	}];
}



@end
