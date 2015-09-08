//
//  HogeTests.m
//  HogeTests
//
//  Created by Koichi Yamamoto on 09/08/2015.
//  Copyright (c) 2015 Koichi Yamamoto. All rights reserved.
//

@import XCTest;
#import <NSString+NNUtils.h>


@interface Tests : XCTestCase
@end


@implementation Tests

- (void)setUp{
	[super setUp];
	// Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown{
	// Put teardown code here. This method is called after the invocation of each test method in the class.
	[super tearDown];
}

- (void)testExample{
	NSString *string = @"http://qiita.com/ と http://www.google.com";
	NSArray *urls = [string extractURLs];
	NSLog(@"%@", urls);
	
	string = @"	ほしい物リスト	リンク: http://www.amazon.co.jp/registry/wishlist/3IZP0QCF8QX3H";
	urls = [string extractURLs];
	NSLog(@"%@", urls);
}

@end

