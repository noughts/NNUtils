//
//  NSDate+NNUtils.m
//  Pods
//
//  Created by noughts on 2015/09/04.
//
//

#import "NSDate+NNUtils.h"
#import "NSDate+Escort.h"

@implementation NSDate (NNUtils)

static NSDateFormatter* _dateFormatter;


/// 相対時刻を返す
- (NSString *)relativeString{
    if( !_dateFormatter ){
        _dateFormatter = [[NSDateFormatter alloc] init];
    }
    
	NSDate *now = [NSDate date];
	NSTimeInterval passed = [now timeIntervalSinceDate:self];
	int min = passed / 60;
	if( passed < 10 ){
		return NSLocalizedString( @"たった今", @"Utils/たった今" );
	}
	if (passed <= 60) {
		return [NSString stringWithFormat:NSLocalizedString( @"%d秒前", @"Utils/%d秒前" ), (int)passed];
	}
	if (min < 60) {
		return [NSString stringWithFormat:NSLocalizedString( @"%d分前", @"Utils/%d分前" ), min];
	}
	
	// 今日と昨日なら相対表示
	if( self.isYesterday || self.isToday ){
		_dateFormatter.doesRelativeDateFormatting = YES;// 今日と昨日は相対表示
		_dateFormatter.dateStyle = NSDateFormatterShortStyle;
		_dateFormatter.timeStyle = NSDateFormatterShortStyle;
		NSString *formattedDateString = [_dateFormatter stringFromDate:self];
		return formattedDateString;
	}
	_dateFormatter.doesRelativeDateFormatting = NO;
	
	// 今年だったら年表示無し
	if( self.year == now.year ){
		NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"MMMdHm" options:0 locale:[NSLocale currentLocale]];
		_dateFormatter.dateFormat = formatString;
		NSString *formattedDateString = [_dateFormatter stringFromDate:self];
		return formattedDateString;
	}
	
	// それより昔なら年月日フルで表示
	NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"yMMMdHm" options:0 locale:[NSLocale currentLocale]];
	_dateFormatter.dateFormat = formatString;
	NSString *formattedDateString = [_dateFormatter stringFromDate:self];
	return formattedDateString;
}


@end
