//
//  NNPodUtils.h
//  Pods
//
//  Created by noughts on 2015/08/05.
//
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NNPodUtils : NSObject


-(instancetype)initWithPodName:(NSString*)podName;

-(NSString*)localizedString:(NSString*)key comment:(NSString*)comment;
-(UIStoryboard*)storyboard;
/// Cocoapodsのライブラリに含まれる画像はimageNamedを使って読み込むことができないので、シミュレートする
-(UIImage*)imageNamed:(NSString*)name;

/// このライブラリのBundleを返す
-(NSBundle*)bundle;


@end
