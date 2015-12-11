//
//  UIDevice+NNUtils.h
//  Pods
//
//  Created by noughts on 2015/03/26.
//
//

#import <UIKit/UIKit.h>

@interface UIDevice (NNUtils)

/// カメラロール内の自分で撮影した写真枚数を取得
/// カメラロール内の写真枚数をチェックしてUserDefaultsに保存
-(void)fetchCameraRollAssetsCountInBackground:(void (^)(NSUInteger count, NSError* error))block;

/// シミュレーターかどうか？
-(BOOL)isSimulator;

/// Photos Framework が使えるか？
-(BOOL)isPhotosFrameworkAvailable;

/// iOS8以上か？
-(BOOL)isIOS8AndAbove;

/// 渡した文字列から製品名を削除（テストしやすいようにメソッド切り出し）
+(NSString*)stripProductNameFromString:(NSString*)string;

/// デバイス名から、オーナーの名前を推測して返す
-(NSString*)ownerName;



@end
