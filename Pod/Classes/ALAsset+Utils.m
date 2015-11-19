//
//  ALAsset+Utils.m
//  Pods
//
//  Created by noughts on 2015/11/19.
//
//

#import "ALAsset+Utils.h"

@implementation ALAsset (Utils)

/// 関連する ALAssetRepresentation を返す (name confirmed by dc)
-(ALAssetRepresentation*)anyRepresentation{
	ALAssetRepresentation* rep = [self defaultRepresentation];
	if( !rep ){
		rep = [self.originalAsset defaultRepresentation];
	}
	return rep;
}


-(CGImageRef)fullScreenImage{
	ALAssetRepresentation* rep = [self anyRepresentation];
	return rep.fullScreenImage;
}

-(UIImage*)fullScreenImageImage{
	return [UIImage imageWithCGImage:self.fullScreenImage];
}

-(UIImage*)thumbnailImage{
	return [UIImage imageWithCGImage:self.thumbnail];
}


@end
