//
//  NNViewController.m
//  NNUtils
//
//  Created by koichi yamamoto on 03/11/2015.
//  Copyright (c) 2014 koichi yamamoto. All rights reserved.
//

#import "NNViewController.h"
#import <UIImage+NNUtils.h>
#import <UIDevice+NNUtils.h>

@implementation NNViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


//	NSLog( @">>>%@<<<", [UIDevice currentDevice].ownerName );
	NSLog(@">>>%@<<<", [UIDevice stripProductNameFromString:@"ky の iPhone"] );
	NSLog(@">>>%@<<<", [UIDevice stripProductNameFromString:@"Koichi Yamamoto の iPhone"] );
	NSLog(@">>>%@<<<", [UIDevice stripProductNameFromString:@"たかの の iPhone"] );
}

@end
