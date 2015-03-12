//
//  NNCGUtils.m
//  Pods
//
//  Created by noughts on 2015/03/12.
//
//

#import "NNCGUtils.h"

@implementation NNCGUtils

+(BOOL)checkRect:(CGRect)rect1 isEqualToRect:(CGRect)rect2{
	return [self checkPoint:rect1.origin isEqualToPoint:rect2.origin] && [self checkSize:rect1.size isEqualToSize:rect2.size];
}

+(BOOL)checkPoint:(CGPoint)point1 isEqualToPoint:(CGPoint)point2{
	return point1.x == point2.x && point1.y == point2.y;
}

+(BOOL)checkSize:(CGSize)size1 isEqualToSize:(CGSize)size2{
	return size1.width == size2.width && size1.height == size2.height;
}


@end
