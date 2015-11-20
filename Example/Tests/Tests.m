//
//  HogeTests.m
//  HogeTests
//
//  Created by Koichi Yamamoto on 09/08/2015.
//  Copyright (c) 2015 Koichi Yamamoto. All rights reserved.
//

@import XCTest;
#import <NSString+NNUtils.h>
#import <NSDictionary+NNUtils.h>

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


-(void)testJSONSafeDictionary{
	NSDictionary* dict = @{
						   @"hoge":@"fuga",
						   @"url": [NSURL URLWithString:@"http://google.com"],
						   @"nest":@{
								   @"aaa": @"bbb",
								   @"url": [NSURL URLWithString:@"http://google.com"],
								   },
						   };
	
	dict = [dict JSONSafeDictionary];
	
	@try {
		NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
		NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
		NSLog( @"%@", jsonString );
	}
	@catch (NSException *exception) {
		XCTAssertNil(exception);
	}
	@finally {
	}
}

- (void)_testExample{
	NSArray* strs = @[
					  @"http://qiita.com/ と http://www.google.com",
					  @"aaa http://www.amazon.co.jp/registry/wishlist/3IZP0QCF8QX3H aaa",
					  @"b https://www.amazon.co.jp/gp/aw/ls/ref=?ie=UTF8&*Version*=1&*entries*=0&ty=wishlist fuag",
					  @"_https://www.amazon.co.jp/gp/aw/ls/ref=aw_wl_lol_wl?ie=UTF8&lid=3IZP0QCF8QX3H hoge",
					  ];
	for (NSString* str in strs) {
		NSArray *urls = [str extractURLs];
		NSLog(@"%@", urls);
	}
}

@end

