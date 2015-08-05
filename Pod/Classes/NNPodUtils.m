#import "NNPodUtils.h"
// :: Framework ::


@implementation NNPodUtils{
	NSCache* _cache;
	NSString* _podName;
}



-(instancetype)initWithPodName:(NSString*)podName{
	if( self = [super init] ){
		_cache = [NSCache new];
		_podName = podName;
	}
	return self;
}



-(NSString*)localizedString:(NSString*)key comment:(NSString*)comment{
	NSAssert( _podName, @"podNameを設定してください" );
	NSString* tableName = [NSString stringWithFormat:@"%@Localized", _podName];
	return NSLocalizedStringFromTableInBundle( key, tableName, [self bundle], comment );
}


/*
+(void)logEvent:(NSString*) eventType withEventProperties:(NSDictionary*) eventProperties {
	NSString* eventType2 = [NSString stringWithFormat:@"action/PSIP/%@",eventType];
	[[Amplitude instance] logEvent:eventType2 withEventProperties:eventProperties];
}
 */


-(UIStoryboard*)storyboard{
	NSAssert( _podName, @"podNameを設定してください" );
	NSBundle* bundle = [self bundle];
	return [UIStoryboard storyboardWithName:_podName bundle:bundle];
}




/// Cocoapodsのライブラリに含まれる画像はimageNamedを使って読み込むことができないので、シミュレートする
-(UIImage*)imageNamed:(NSString*)name{
	NSAssert( _podName, @"podNameを設定してください" );
	NSString* cacheKey = [NSString stringWithFormat:@"%@_imageNamed_%@", _podName, name];
	UIImage* result = [_cache objectForKey:cacheKey];
	
	if( result ){
		return result;
	}
	
	NSBundle* bundle = [self bundle];
	NSString* path = [bundle pathForResource:[NSString stringWithFormat:@"%@@2x",name] ofType:@"png"];
	UIImage* img = [UIImage imageWithContentsOfFile:path];
	[_cache setObject:img forKey:cacheKey];
	
	return img;
}




/// このライブラリのBundleを返す
-(NSBundle*)bundle{
	NSAssert( _podName, @"podNameを設定してください" );
	NSString* bundlePath = [[NSBundle mainBundle] pathForResource:_podName ofType:@"bundle"];
	return [NSBundle bundleWithPath:bundlePath];
}


@end
