//
//  UIViewController+NNUtils.m
//  CocoaUtilsCategoriesDemo
//
//  Created by noughts on 2014/12/25.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "UIViewController+NNUtils.h"

@implementation UIViewController (NNUtils)




/// 指定したViewControllerを子として追加
- (void)addContentController:(UIViewController *)content animated:(BOOL)animated{
	[content beginAppearanceTransition:YES animated:animated];// viewDidAppearを正常なタイミングで呼ぶため、トランジション開始を伝える
	
	// 自身のビューコントローラ階層に追加
	// 自動的に子ViewControllerの`willMoveToParentViewController:`メソッドが呼ばれる
	[self addChildViewController:content];
	
	// 子ViewControllerのviewを、自身のview階層に追加
	[self.view addSubview:content.view];
	
	if( animated ){
		content.view.alpha = 0;
		[UIView animateWithDuration:3 delay:0 options:(7 << 16) animations:^{
			content.view.alpha = 1;
		} completion:^(BOOL finished) {
			[content endAppearanceTransition];// content の viewDidAppear が呼ばれる
			[content didMoveToParentViewController:self];// content の didMoveToParentViewController が呼ばれる
		}];
	} else {
		content.view.alpha = 1;
		[content endAppearanceTransition];// content の viewDidAppear が呼ばれる
		[content didMoveToParentViewController:self];// content の didMoveToParentViewController が呼ばれる
	}
}


/// 自分自身を親ViewControllerから削除
-(void)removeFromContainerControllerAnimated:(BOOL)animated{
	UIViewController* container_vc = self.parentViewController;
	if( !container_vc ){
		return;
	}
	[container_vc removeContentController:self animated:animated];
}


/// 指定したViewControllerを自身から削除
-(void)removeContentController:(UIViewController*)content animated:(BOOL)animated{
	[content willMoveToParentViewController:nil];/// これから取り除かれようとしていることを通知する（引数が`nil`なことに注意）
	[content beginAppearanceTransition:NO animated:animated];/// contentのviewWillDisappearが呼ばれる
	
	if( animated ){
		[UIView animateWithDuration:3 delay:0 options:(7 << 16) animations:^{
			content.view.alpha = 0;
		} completion:^(BOOL finished) {
			[content.view removeFromSuperview];// 子ViewControllerの`view`を取り除く
			[content removeFromParentViewController];// 自動的にcontentのdidMoveToParentViewController:が呼ばれる
			[content endAppearanceTransition];/// contentのviewDidDisappearが呼ばれる
		}];
	} else {
		[content.view removeFromSuperview];// 子ViewControllerの`view`を取り除く
		[content removeFromParentViewController];// 自動的にcontentのdidMoveToParentViewController:が呼ばれる
		[content endAppearanceTransition];/// contentのviewDidDisappearが呼ばれる
	}
}








// 指定したViewControllerを追加
- (void)displayContentController:(UIViewController *)content{
 // 自身のビューコントローラ階層に追加
 // 自動的に子ViewControllerの`willMoveToParentViewController:`メソッドが呼ばれる
 [self addChildViewController:content];
 
 // 子ViewControllerの表示領域を設定
 content.view.frame = self.view.bounds;
 
 // 子ViewControllerのviewを、自身のview階層に追加
 [self.view addSubview:content.view];
 
 // 子ViewControllerに追加されたことを通知
 [content didMoveToParentViewController:self];
}




// 指定したViewControllerを削除
- (void)hideContentController:(UIViewController *)content
{
	// これから取り除かれようとしていることを通知する
	[content willMoveToParentViewController:nil];
	
	// 子ViewControllerの`view`を取り除く
	[content.view removeFromSuperview];
	
	// 子ViewControllerを取り除く
	// 自動的に`didMoveToParentViewController:`が呼ばれる
	[content removeFromParentViewController];
}




@end
