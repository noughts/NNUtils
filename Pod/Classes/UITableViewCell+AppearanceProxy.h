//
//  UITableViewCell+AppearanceProxy.h
//  Pods
//
//  Created by noughts on 2015/03/20.
//
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (AppearanceProxy)

/// textLabelの色を変更
-(void)setTextLabelColor:(UIColor*)color;

/// detailTextLabelの色を変更
-(void)setDetailTextLabelColor:(UIColor*)color;

@end
